import 'package:authbased/src/features/authentication/models/user_model.dart';
import 'package:authbased/src/repository/authentication_repository/authentication_repository.dart';
import 'package:authbased/src/repository/user_repository/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  final userRepo = Get.put(UserRepository());

  //Text field controllers to get data from textfields
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  //loader
  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //call this function from the design and it will do the rest
  void registerUser(String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
  }

  //user repositoy
  Future<void> createUser(UserModel user) async {
    //await userRepo.createUser(user);

    try {
      isLoading.value = true;
      if (!signupFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }
      final user = UserModel(
        fullName: fullName.text.trim(),
        phoneNo: phoneNo.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
      );

      //Authenticate user first
      final auth = AuthenticationRepository.instance;
      await auth.createUserWithEmailAndPassword(user.email, user.password);

      await UserRepository.instance.createUser(user);
      auth.setInitialScreen(auth.firebaseUser as User?);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString(),
          snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 5));
    }
  }
}
