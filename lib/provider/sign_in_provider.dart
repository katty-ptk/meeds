// ignore_for_file: unused_local_variable
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meeds/screens/start/landing_page.dart';
import 'package:meeds/screens/start/login_page.dart';
import 'package:meeds/screens/start/signup_page.dart';
import 'package:meeds/utils/next_screen.dart';
import 'package:meeds/widgets/bnb_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier {
  // instances
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  SignInProvider() {
    checkSignInUser();
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

  signInUser(context) async {
    final SharedPreferences s = await SharedPreferences.getInstance();

    if (_isSignedIn == true) {
      s.setBool("signed_in", true);
      nextScreenReplace(context, NavigationScreen());
    } else {
      print("problem :/");
    }
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

      await this.checkSignInUser();
      await this.saveUserToFirestore(_name, _email, _uid);
      await this.signInUser(context);
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

  // entry for firestore
  Future getUserDataFromFirestore(uid) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .get()
        .then((DocumentSnapshot snapshot) {
      // _uid  = snapshot['uid'];
      // _email  = snapshot['email'];
      // _name  = snapshot['name'];
      // _provider  = snapshot['provider'];
      // _imageURL  = snapshot['image_url'];
    });
  }

  // save user to firestore
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

  Future signOutUser(context) async {
    final SharedPreferences s = await SharedPreferences.getInstance();

    await FirebaseAuth.instance.signOut();
    await s.setBool("signed_in", false);
    _isSignedIn = false;

    notifyListeners();
    nextScreenReplace(context, LandingPage());
  }
}
