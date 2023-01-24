import 'package:flutter/material.dart';
import 'package:meeds/utils/meeds_colors.dart';
import 'package:meeds/widgets/profile_image.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../services/firestore.service.dart';
import '../../../../utils/next_screen.dart';
import '../../../../widgets/bnb_screen.dart';

class GratitudeJournalEntry extends StatefulWidget {
  const GratitudeJournalEntry({super.key});

  @override
  State<GratitudeJournalEntry> createState() => _GratitudeJournalEntryState();
}

class _GratitudeJournalEntryState extends State<GratitudeJournalEntry> {
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
      "gratitude"
    );

    nextScreenReplace(context, NavigationScreen());
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ProfileImageBG(non_profile: true, text: "Gratitude",),
          SizedBox(height: 40,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              '“When we focus on our gratitude, the tide of disappointment goes out and the tide of love rushes in.“',
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
                    label: Text("What are you grateful for?"),
                    labelStyle: TextStyle(
                      color: MyColors.dark_purple
                    ),
                    hintText: "😉: I am grateful for ...",
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
                    label: Text("Why are you grateful for this?"),
                    labelStyle: TextStyle(
                      color: MyColors.dark_purple
                    ),
                    hintText: "😉: Because it helpes me ...",
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
                    hintText: "😉: This makes me feel ...",
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