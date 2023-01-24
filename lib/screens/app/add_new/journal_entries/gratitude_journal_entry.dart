import 'package:flutter/material.dart';
import 'package:meeds/utils/meeds_colors.dart';
import 'package:meeds/widgets/entries/journal_entry.dart';
import 'package:meeds/widgets/profile_image.dart';

class GratitudeJournalEntry extends StatefulWidget {
  const GratitudeJournalEntry({super.key});

  @override
  State<GratitudeJournalEntry> createState() => _GratitudeJournalEntryState();
}

class _GratitudeJournalEntryState extends State<GratitudeJournalEntry> {
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

              SizedBox(height: 50,),
              Icon(Icons.check_circle, color: Colors.green, size: 48,),
              SizedBox(height: 150,)
            ],),
          )
        ]),
    );
  }
}