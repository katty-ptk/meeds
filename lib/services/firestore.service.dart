import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meeds/utils/date.utils.dart';
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
          "date": DateUtil().formatDate(DateTime.now()),
          "data": entry_text
        }
      },

      SetOptions(
        merge: true
      )
    ).then((value) => print("added journal entry! :D"));
  }

  Future<List> getJournalEntryData( String? doc_id ) async {
    final doc = await firestore.collection(firestorePaths.journal_entries_types["JOURNAL_ENTRIES_COLLECTION"]).doc(doc_id).get();

    final doc_entries = doc.data()!;
    List entries = [];

    doc_entries.forEach((key, value) => 
      entries.add(doc_entries[key])
    );

    return entries;
  }
  
}