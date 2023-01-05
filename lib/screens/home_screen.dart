import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meeds/screens/landing_page.dart';
import 'package:meeds/utils/next_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String _name = FirebaseAuth.instance.currentUser != null ? FirebaseAuth.instance.currentUser!.email.toString() : "asd";

  @override
  Widget build(BuildContext context) {
    if ( FirebaseAuth.instance.currentUser != null ) {
      _name = FirebaseAuth.instance.currentUser!.email.toString();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Meeds Home Screen!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${_name}"
            ),
            ElevatedButton(onPressed: (){
              FirebaseAuth.instance.signOut();
              nextScreenReplace(context, LandingPage());
            }, child: Text("Sign Out"))
          ],
        ),
      ));
  }
}