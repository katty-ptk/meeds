// ignore: file_names
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
          child: Center(
        child: Text(
          'Welcome to meeds! 💊',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}
