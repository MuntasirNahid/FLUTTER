import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //signup user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Something Error Occurred';
    try {
      //register user
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        //save info to the database
        await _firestore.collection('users').doc(cred.user!.uid).set(
          {
            'username': username,
            'uid': cred.user!.uid,
            'email': email,
            'bio': bio,
            'followers': [],
            'following': [],
          },
        );

        res = 'Sign up successfull';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
