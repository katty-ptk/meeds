import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../services/firestore.service.dart';
import '../../../../utils/meeds_colors.dart';
import '../../../../utils/next_screen.dart';
import '../../../../widgets/bnb_screen.dart';
import '../../../../widgets/profile_image.dart';

class HardDayJournalEntry extends StatefulWidget {
  const HardDayJournalEntry({super.key});

  @override
  State<HardDayJournalEntry> createState() => _HardDayJournalEntryState();
}

class _HardDayJournalEntryState extends State<HardDayJournalEntry> {
  String entry_text = "";
  String what = "";
  String why = "";
  String anything_else = "";

  handleSave() async {
    final sp = await SharedPreferences.getInstance();
    final _email = await sp.getString("email");

    final FirestoreService firestoreService = context.read<FirestoreService>();

    entry_text = "$what $why $anything_else";
    print(entry_text);

    await firestoreService.addJournalEntry(
      entry_text,
      _email,
      "hard_day"
    );

    nextScreenReplace(context, NavigationScreen());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ProfileImageBG(non_profile: true, text: "Hard Day",),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              '“It is just a bad day, not a bad life.“',
              style: TextStyle(
                fontSize: 24,
                color: Colors.grey.shade500,
                fontStyle: FontStyle.italic
              ),
            ),
          ),

          SizedBox(height: 50,),

          // form
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(children: [
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 200
                ),
                child: TextFormField(
                  onChanged: ( value ) {
                    setState( () {
                      what = value.characters.toString();
                    });
                  },
                  maxLines: null,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: MyColors.light_pink,
                        width: 2
                      )
                    ),
                    label: Text("What made this day hard?"),
                    labelStyle: TextStyle(
                      color: MyColors.dark_purple
                    ),
                    hintText: "🙃: This day is hard because ...",
                  ),
                ),
              ),
              SizedBox(height: 30,),

              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 200
                ),
                child: TextFormField(
                  onChanged: ( value ) {
                    setState( () {
                      why = value.characters.toString();
                    });
                  },
                  maxLines: null,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: MyColors.light_pink,
                        width: 2
                      )
                    ),
                    label: Text("Why do you feel sad about it?"),
                    labelStyle: TextStyle(
                      color: MyColors.dark_purple
                    ),
                    hintText: "🙃: I feel sad because ...",
                  ),
                ),
              ),
              SizedBox(height: 30,),

              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 200
                ),
                child: TextFormField(
                  onChanged: ( value ) {
                    setState( () {
                      anything_else = value.characters.toString();
                    });
                  },
                  maxLines: null,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: MyColors.light_pink,
                        width: 2
                      )
                    ),
                    label: Text("Anything else you would like to add?"),
                    labelStyle: TextStyle(
                      color: MyColors.dark_purple
                    ),
                    hintText: "🙃: I know I will be okay.",
                  ),
                ),
              ),

              SizedBox(height: 50,),
              GestureDetector(
                onTap: handleSave,
                child: Icon(Icons.check_circle, color: Colors.green, size: 48,)
              ),
              SizedBox(height: 150,)
            ],),
          )
        ]),
    );
  }
}