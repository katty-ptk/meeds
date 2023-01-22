import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeds/utils/firestore_paths.dart';

class FirestoreService extends ChangeNotifier {
  // instances
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirestorePaths firestorePaths = new FirestorePaths();

  addJournalEntry( String entry_text, String? email, String journal_entry_type ) async {
    DocumentReference documentReference = firestore.collection(firestorePaths.journal_entries_types["JOURNAL_ENTRIES_COLLECTION"]).doc(email);

    documentReference.set(
      {
        "${DateTime.now().millisecondsSinceEpoch}" : {
          "journal_entry_type": journal_entry_type,
          "title": "💕 🌙 🤩",
          "data": entry_text
        }
      },

      SetOptions(
        merge: true
      )
    ).then((value) => print("added journal entry! :D"));
  }
  
}