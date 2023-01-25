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
  List<String> app_types = [];
  List<String> app_dates = [];

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
    List<String> _journal_types = [];
    List<String> _journal_dates = [];

    final entries = await FirestoreService().getJournalEntryData(
      sp.getString("email")
    );

    if ( entries.isNotEmpty ) {
      entries.forEach((element) {
        _journal_entries.add(element["data"]);
        _journal_types.add(element["journal_entry_type"]);
        _journal_dates.add(element["date"]);
      },);
    }

    print(_journal_types);

    setState(() {
      app_entries = _journal_entries;
      app_types = _journal_types;
      app_dates = _journal_dates;
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
                        itemCount: app_entries.length,
                        itemBuilder: ( context, index ) {
                          return ListTile(
                            title: JournalEntry(
                              data: app_entries[index], 
                              date: "${app_dates[index]}",
                              type: app_types[index],
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