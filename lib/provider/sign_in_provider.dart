// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meeds/screens/home_screen.dart';
import 'package:meeds/utils/next_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider extends ChangeNotifier {
  // instances
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;


  SignInProvider() {
    checkSignInUser();
  }

  Future signUpUser( String email, String password, context) async {
    try {
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        final _user = await credential.user!;
        final _uid = await _user.uid;
        final _email = await _user.email;

        //List values = nums.split(".");
        // final _name = await _user.email!.substring(-1, _user.email!.indexOf('@'));
        List _nameList = await _user.email!.split("@");
        final _name = _nameList[0];
        
        await this.saveUserToFirestore(_name, _email, _uid);

        // go to homescreen
        nextScreenReplace(context, HomeScreen());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
  }

  Future loginUser( String email, String password, context ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );

      nextScreenReplace(context, HomeScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch ( e ) {
      print ( e );
    }
  }

  Future checkSignInUser() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("signed_in") ?? false;
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
  Future saveUserToFirestore(name, email, uid ) async {
    final DocumentReference r = FirebaseFirestore.instance.collection("users").doc(uid);

    await r.set({
      "name": name,
      "email": email,
      "uid": uid,
    });

    // notifyListeners();
  }
}
