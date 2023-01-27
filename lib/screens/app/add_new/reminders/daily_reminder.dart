import 'package:flutter/material.dart';
import 'package:meeds/services/sign_in.service.dart';
import 'package:meeds/widgets/profile_image.dart';
import 'package:provider/provider.dart';

import '../../../../utils/meeds_colors.dart';

class AddNewDailyReminder extends StatefulWidget {
  const AddNewDailyReminder({super.key});

  @override
  State<AddNewDailyReminder> createState() => _AddNewDailyReminderState();
}

class _AddNewDailyReminderState extends State<AddNewDailyReminder> {
  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();

    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ProfileImageBG(non_profile: true, text: "Daily Reminder",),
          Container(
              padding: EdgeInsets.only(top: 100, left: 30, right: 30),
              child: Text(
                "Hi, ${sp.userName}! 😊",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 30, right: 30),
              child: Text(
                "What would you like to be reminded of?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),

            SizedBox(height: 30,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: MyColors.light_pink,
                        width: 2
                      )
                    ),
                    label: Text("Remind me to ..."),
                    labelStyle: TextStyle(
                      color: MyColors.dark_purple
                    ),
                    hintText: "😉: Drink water",
                  ),
              ),
            ),

            SizedBox(height: 25,),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "When?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),

                GestureDetector(
                  child: Text(
                    "Choose time",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: MyColors.dark_purple
                    ),
                  ),
                )
              ],),
            ),

            SizedBox(height: 50,),
            GestureDetector(
              onTap: (){},
              child: Icon(Icons.check_circle, color: Colors.green, size: 48,)
            ),
            SizedBox(height: 150,)
        ],
      )
    );
  }
}