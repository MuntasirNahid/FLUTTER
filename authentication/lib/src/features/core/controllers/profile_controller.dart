import 'package:authbased/src/features/authentication/models/user_model.dart';
import 'package:authbased/src/repository/authentication_repository/authentication_repository.dart';
import 'package:authbased/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//this interects with the screen
class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  //Get user email and pass to user repository to fetch user record
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;

    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar('Error', 'Login to continue');
    }
  }

  //getting all user
  Future<List<UserModel>> getAllUser() async {
    return await _userRepo.allUser();
  }

  //updating user record
  Future<bool> updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
    return true;
  }
}
