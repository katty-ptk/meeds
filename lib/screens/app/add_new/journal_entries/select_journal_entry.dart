import 'package:flutter/material.dart';
import 'package:meeds/screens/app/add_new/journal_entries/gratitude_journal_entry.dart';
import 'package:meeds/screens/app/add_new/journal_entries/hard_day_journal_entry.dart';
import 'package:meeds/services/sign_in.service.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/option_tab.dart';
import '../../../../widgets/profile_image.dart';
import 'empty_journal_entry.dart';

class SelectJournalEntry extends StatelessWidget {
  const SelectJournalEntry({super.key});

  @override
  Widget build(BuildContext context) {
    final sp = context.read<SignInProvider>();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileImageBG(text: "Journal Entry", non_profile: true,),
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
                "What kind of journaling would you like to do?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50, left: 30, right: 30),
              child: Column(
                children: [
                  OptionTab(text: "Plain ( no template )", page: EmptyJournalEntry()),
                  SizedBox(height: 20,),
                  OptionTab(text: "Gratitude", page: GratitudeJournalEntry()),
                  SizedBox(height: 20,),
                  OptionTab(text: "Hard Day", page: HardDayJournalEntry()),
                ],
              ),
            ),
          ],
        ),
    );
  }
}