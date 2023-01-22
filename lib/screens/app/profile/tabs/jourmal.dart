import 'package:flutter/material.dart';
import 'package:meeds/widgets/profile_image.dart';

class JournalEntries extends StatefulWidget {
  const JournalEntries({super.key});

  @override
  State<JournalEntries> createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            ProfileImageBG(non_profile: true, text: "Journal",),
          ],
        ),
    );
  }
}