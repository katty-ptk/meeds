import 'package:flutter/material.dart';
import 'package:meeds/provider/sign_in_provider.dart';
import 'package:meeds/screens/app/profile/tabs/jourmal.dart';
import 'package:meeds/utils/meeds_colors.dart';
import 'package:meeds/widgets/option_tab.dart';
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

    return Scaffold(
      body: SafeArea(
        child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileImageBG(non_profile: false,),
            Padding(
              padding: EdgeInsets.only(top: 120, left: 30, right: 30),
              child: Column(
                children: [
                  OptionTab(text: "Journal entries", page: JournalEntries()),
                  SizedBox(height: 20,),
                  OptionTab(text: "Daily Reminders", page: JournalEntries()),
                  SizedBox(height: 20,),
                  OptionTab(text: "Medication", page: JournalEntries()),
                ],
              ),
            ),
            
            ElevatedButton(
              onPressed: handleLogout, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyColors.dark_purple),
              ),
              child: Text("Logout")
            )
          ],
        ),
      )
    );
  }
}