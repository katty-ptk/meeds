import 'package:flutter/material.dart';
import '../../provider/sign_in_provider.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
  signOut() async {
    final sp = context.read<SignInProvider>();
    await sp.signOutUser(context);
  }

    return Center(child: GestureDetector(
      onTap: () {signOut();},
      child: Text("Profile Page",style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold
      )),
    ));
  }
}