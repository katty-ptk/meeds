// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:meeds/widgets/entries/journal_entry.dart';
import 'package:meeds/widgets/profile_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../services/firestore.service.dart';

class JournalEntries extends StatefulWidget {
   JournalEntries({super.key});

  @override
  State<JournalEntries> createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries> {
  List<String> app_entries = [];

  @override
  void initState() {
    getData();
    super.initState();
  }

   void getData() async {
    await getJournalEntriesFromFirestore();
   }

    getJournalEntriesFromFirestore() async {
      final sp = await SharedPreferences.getInstance();
      List<String> _journal_entries = [];

      final entries = await FirestoreService().getJournalEntryData(
        sp.getString("email")
      );

      if ( entries.isNotEmpty ) {
        entries.forEach((element) {
          _journal_entries.add(element["data"]);
        },);
      }

      setState(() {
        app_entries = _journal_entries;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            ProfileImageBG(non_profile: true, text: "Journal",),
            SizedBox(height: 20,),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 500,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: ( context, index ) {
                          return ListTile(
                            title: JournalEntry(
                              data: app_entries[index], 
                              date: "${DateTime.now().toString()}",
                              type: "plain",
                            ),
                          );
                        }),
                    )
                  ],
                )
                ),
            ),
          ],
        ),
    );
  }
}