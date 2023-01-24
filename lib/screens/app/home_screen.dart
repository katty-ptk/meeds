import 'package:flutter/material.dart';
import 'package:meeds/services/sign_in.service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();

    return Center(child: Text("${sp.userEmail}", style: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold
    ),));
  }
}