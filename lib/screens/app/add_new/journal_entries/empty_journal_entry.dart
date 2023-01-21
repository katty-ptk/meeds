import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meeds/utils/meeds_colors.dart';
import 'package:meeds/utils/next_screen.dart';
import 'package:meeds/widgets/bnb_screen.dart';
import 'package:meeds/widgets/profile_image.dart';
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
      DocumentReference ref = FirebaseFirestore.instance.collection("journal_entries").doc(sp.getString("email"));

      ref.set({
        "${DateTime.now().millisecondsSinceEpoch}": {
          "title": "title of entry",
          "data": entry_text
        },
      },
      SetOptions(
        merge: true
      )
      ).then( ( value ) {
        print("added it! :D");
      }
      );

      print(entry_text);
      nextScreenReplace(context, NavigationScreen());
    }

    return Scaffold(
      body: SafeArea(
        child: ListView(
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
      ),
    );
  }
}