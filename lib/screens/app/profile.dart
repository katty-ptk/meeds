import 'package:flutter/material.dart';
import 'package:meeds/provider/sign_in_provider.dart';
import 'package:meeds/widgets/profile_image.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    handleLogout() async {
      final sp = context.read<SignInProvider>();
      
      await sp.signOutUser(context);
    }

    Widget buildOption( String text ) {
      return GestureDetector(
        onTap: () {
          print("tap on option");
        },
        child: Stack(
          children: [
            Text(text, style: TextStyle(
              fontSize: 18,
              // fontWeight: FontWeight.bold
            ),),
            Positioned(right: 10, child: Icon(Icons.navigate_next_outlined)),
            Divider(thickness: 2, height: 60, color: Colors.purple,)
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileImageBG(),
            Padding(
              padding: EdgeInsets.only(top: 120, left: 30, right: 30),
              child: Column(
                children: [
                  buildOption("Journal entries"),
                  SizedBox(height: 20,),
                  buildOption("Daily Reminders"),
                  SizedBox(height: 20,),
                  buildOption("Medication"),
                ],
              ),
            ),
            
            ElevatedButton(
              onPressed: handleLogout, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.purple.shade200),
              ),
              child: Text("Logout")
            )
          ],
        ),
      )
    );
  }
}