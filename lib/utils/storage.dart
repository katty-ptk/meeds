import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core; 

class Storage {
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

  uploadToCloud( String filePath, String fileName ) async {
    File file = File(filePath);

    try {
      return await storage.ref("/profile_pictures/$fileName").putFile(file).snapshot.ref.getDownloadURL().toString();
    } on firebase_core.FirebaseException catch ( error ) {
      print (error);
    }
  }

}