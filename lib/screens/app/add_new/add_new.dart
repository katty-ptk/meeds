import 'package:flutter/material.dart';
import 'package:meeds/screens/app/add_new/journal_entries/select_journal_entry.dart';
import 'package:meeds/screens/app/profile/profile.dart';

import '../../../widgets/option_tab.dart';
import '../../../widgets/profile_image.dart';

class AddNew extends StatelessWidget {
  const AddNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileImageBG(text: "Add new ...", non_profile: true,),
            Padding(
              padding: EdgeInsets.only(top: 120, left: 30, right: 30),
              child: Column(
                children: [
                  OptionTab(text: "Journal Entry", page: SelectJournalEntry()),
                  SizedBox(height: 20,),
                  OptionTab(text: "Daily Reminder", page: ProfileScreen()),
                  SizedBox(height: 20,),
                  OptionTab(text: "Medication", page: ProfileScreen()),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}