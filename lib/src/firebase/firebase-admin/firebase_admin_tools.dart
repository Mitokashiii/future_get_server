import 'dart:io';
import 'package:firebase_admin/firebase_admin.dart';

class FirebaseAdminTools {
  FirebaseAdminTools._();

  String? genereateCustomToken(
      {required File serviceAccountFile, required String uid}) {
    try {
      var credential = Credentials.getApplicationFromServiceAccount(
          File('service-account.json'));

      if (credential == null) {
        throw Exception('Credential is null');
      }

      Credentials.setApplicationDefaultCredential(credential);

      var app = FirebaseAdmin.instance
          .initializeApp(AppOptions(credential: credential));

      var token = app.auth().createCustomToken(uid);

      return token;
    } catch (e) {
      print('genereateCustomToken error: $e');
      return null;
    }
  }
}