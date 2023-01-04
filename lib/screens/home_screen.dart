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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meeds Home Screen!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              FirebaseAuth.instance.currentUser!.email.toString()
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