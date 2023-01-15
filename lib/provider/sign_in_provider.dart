// ignore_for_file: unused_local_variable
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meeds/screens/start/landing_page.dart';
import 'package:meeds/screens/start/login_page.dart';
import 'package:meeds/screens/start/signup_page.dart';
import 'package:meeds/utils/next_screen.dart';
import 'package:meeds/utils/storage.dart';
import 'package:meeds/widgets/bnb_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier {
  // instances
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Storage storage = Storage();

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  String _user_name = "";
  String get userName => _user_name;

  String _user_email = "";
  String get userEmail => _user_email;


  String _user_uid = "";
  String get userUid => _user_uid;

  SignInProvider() {
    checkSignInUser();
  }

  Future signUpUser(String email, String password, context) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final _user = await credential.user!;
      final _uid = await _user.uid;
      final _email = await _user.email;

      List _nameList = await _user.email!.split("@");
      final _name = _nameList[0];

      await this.saveUserToFirestore(_name, _email, _uid);
      await this.getUserDataFromFirestore(_uid);
      await this.signInUser(context);
      await this.checkSignInUser();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar(
          "Weak Password.", 
          "Try Again", 
          context
        );
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(
          "This email is already in use.", 
          "Login", 
          context
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future loginUser(String email, String password, context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      await this.getUserDataFromFirestore(credential.user?.uid);
      await this.checkSignInUser();
      await this.signInUser(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar(
          "No account found for this email.", 
          "SignUp", 
          context
        );
      } else if (e.code == 'wrong-password') {
        showSnackbar(
          "Wrong Password", 
          "Try Again", 
          context
        );
      }
    } catch (e) {
      print(e);
    }
  }

  signInUser(context) async {
    final SharedPreferences s = await SharedPreferences.getInstance();

    if (_isSignedIn == true) {
      s.setBool("signed_in", true);
      nextScreenReplace(context, NavigationScreen());
    } else {
      print("problem :/");
    }
  }
  
  Future saveUserToFirestore(name, email, uid) async {
    final DocumentReference r =
        FirebaseFirestore.instance.collection("users").doc(uid);

    await r.set({
      "name": name,
      "email": email,
      "uid": uid,
    });

    // notifyListeners();
  }

  Future getUserDataFromFirestore(uid) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) {
          _user_uid  = snapshot['uid'];
          _user_name  = snapshot['name'];
          _user_email  = snapshot['email'];
    });
  }

  Future<bool> checkUserExists(uid) async {
    DocumentSnapshot snap =
        await FirebaseFirestore.instance.collection("users").doc(uid).get();

    if (snap.exists) {
      print("existing user");
      return false;
    }

    print("new user");
    return true;
  }

  Future checkSignInUser() async {
    final SharedPreferences s = await SharedPreferences.getInstance();

    if (auth.currentUser != null || s.getBool("signed_in") == true) {
      _isSignedIn = true;
    } else {
      _isSignedIn = false;
    }

    notifyListeners();
  }

  // check if user exists in firesore
  Future signOutUser(context) async {
    final SharedPreferences s = await SharedPreferences.getInstance();

    await FirebaseAuth.instance.signOut();
    await s.setBool("signed_in", false);
    _isSignedIn = false;

    notifyListeners();
    nextScreenReplace(context, LandingPage());
  }

  showSnackbar(message, label_text, context) {
    final snackBar = SnackBar(
      content: Row(children: [
        Icon(Icons.error_outline, size: 32,),
        SizedBox(width: 16,),
        Expanded(child: Text(
          message,
        ))
      ],),
      action: SnackBarAction(
        label: label_text,
        onPressed: () {
          switch ( label_text ) {
            case "Login":
              nextScreen(context, LoginPage());
              break;

            case "SignUp":
              nextScreen(context, SignUpPage());
              break;

            default:
              print("error ${message}");
          }
        },
      ),
      margin: EdgeInsets.symmetric(vertical: 100, horizontal: 12),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red[700],
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  uploadPic(context) async {
    print(_user_name);
    final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );

    if ( results == null ){
      showSnackbar("Cannpt upload null", "Try again", context);
      return null; 
    }

    final filePath = results.files.single.path.toString();
    final fileName = _user_email;

    storage.uploadToCloud(filePath, fileName).then(
      print ("doone:D")
    );
  }
}
