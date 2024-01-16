import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

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

        print("SIgn up completed, userId = ${cred.user!.uid}");

        //Adding Photo to the database
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        print("Photo Added SuccessFully");

        //save info to the database

        UserModel user = UserModel(
          email: email,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          username: username,
          bio: bio,
          followers: [],
          following: [],
        );
        await _firestore.collection("users").doc(cred.user!.uid).set(
              user.toJson(),
            );

        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  //login

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = 'Please enter all the fields';
      }
    } //can use FirebaseAuth exception to create custom error message
    catch (err) {
      res = err.toString();
    }
    return res;
  }
}
