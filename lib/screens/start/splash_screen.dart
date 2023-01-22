import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meeds/provider/sign_in.service.dart';
import 'package:meeds/screens/start/landing_page.dart';
import 'package:meeds/utils/config.dart';
import 'package:meeds/utils/next_screen.dart';
import 'package:meeds/widgets/bnb_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  // init state
  @override
  void initState() {
    final sp = context.read<SignInProvider>();
    sp.checkSignInUser();
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    // timer for 2 seconds
    Timer(const Duration(seconds: 2), () {
      sp.userEmail != ""
          ? nextScreenReplace(context, NavigationScreen())  // home screen
          : nextScreenReplace(context, LandingPage());
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: Image(
            image: AssetImage(Config.app_logo),
            height: 80,
            width: 80,
          ),
        ),
      )),
    );
  }
}
