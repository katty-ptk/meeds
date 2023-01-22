import 'package:flutter/material.dart';
import 'package:meeds/services/firestore.service.dart';
import 'package:meeds/utils/meeds_colors.dart';
import 'package:meeds/utils/next_screen.dart';
import 'package:meeds/widgets/bnb_screen.dart';
import 'package:meeds/widgets/profile_image.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmptyJournalEntry extends StatefulWidget {
  const EmptyJournalEntry({super.key});

  @override
  State<EmptyJournalEntry> createState() => _EmptyJournalEntryState();
}

class _EmptyJournalEntryState extends State<EmptyJournalEntry> {
  String entry_text = "";
  
  @override
  Widget build(BuildContext context) {

    handleSave() async {
      final sp = await SharedPreferences.getInstance();
      final _email = await sp.getString("email");

      final FirestoreService firestoreService = context.read<FirestoreService>();

      await firestoreService.addJournalEntry(
        entry_text,
        _email,
        "plain"
      );

      nextScreenReplace(context, NavigationScreen());
    }

    return Scaffold(
      body: Column(
          // direction: Axis.vertical,
          children: [
            ProfileImageBG(non_profile: true, text: "Plain"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50,),
                  Text(
                    '“A journal is your completely unaltered voice.“',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey.shade500,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                      onChanged: (value) {
                        setState(() {
                          entry_text = value.characters.toString();
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Start typing here...",
                      ),
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      maxLines: null,
                    ),
                    SizedBox(height: 15,),
                    Center(
                      child: FloatingActionButton(
                        backgroundColor: MyColors.dark_purple,
                        onPressed: handleSave,
                        child: Icon(
                          Icons.check,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
    );
  }
}