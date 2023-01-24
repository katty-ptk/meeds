import 'package:flutter/material.dart';
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
      body: Column(children: [
        ProfileImageBG(non_profile: true, text: "Gratitude",),
        Padding(
          padding: const EdgeInsets.all(35),
          child: JournalEntry(data: "sad", date: "01.01.0101", type: "gratitude"),
        )
      ],)
    );
  }
}