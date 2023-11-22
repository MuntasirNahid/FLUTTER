import 'package:authbased/src/features/authentication/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//this repo interects with the database
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  //store user in firestore
  createUser(UserModel user) async {
    //we want to add into Users collection of our firebase db and add our user into json formate which is implemented into UserModel Class
    await _db
        .collection('Users')
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
            'Success',
            'Your account has been created.',
            backgroundColor: Colors.green.withOpacity(0.1),
            snackPosition: SnackPosition.BOTTOM,
            colorText: Colors.green,
          ),
        )
        .catchError(
      (error, StackTrace) {
        Get.snackbar(
          'Error',
          'Something went wrong.Try Again.',
          backgroundColor: Colors.red.withOpacity(0.1),
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.red,
        );
        print(error.toString());
      },
    );
  }

  //Fetch  individual user details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection('Users').where("Email", isEqualTo: email).get();

    //Getting a single userData
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  //Fetch all users data
  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection('Users').get();

    //Getting all users data in a list.there may be one or more
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection('Users').doc(user.id).update(user.toJson());
  }
}
