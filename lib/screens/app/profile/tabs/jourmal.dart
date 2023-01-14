import 'package:flutter/material.dart';

class JournalEntries extends StatefulWidget {
  const JournalEntries({super.key});

  @override
  State<JournalEntries> createState() => _JournalEntriesState();
}

class _JournalEntriesState extends State<JournalEntries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "My journal entries 💕"
        ),
      ),
    );
  }
}