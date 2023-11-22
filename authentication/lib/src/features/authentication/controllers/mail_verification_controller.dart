import 'package:authbased/src/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';
import 'package:get/get.dart';

class MailVerificationController extends GetxController {
  late Timer _timer;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }

  //send or resend email verification
  Future<void> sendVerificationEmail() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  //set timer to check if verification completed and then autoRedirect
  void setTimerForAutoRedirect() {
    _timer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        //it will reload the state of the current user
        FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user!.emailVerified) {
          timer.cancel();
          AuthenticationRepository.instance.setInitialScreen(user);
        }
      },
    );
  }

  //manually check if verification completed then redirect
  void manuallyCheckEmailVerificationStatus() {
    FirebaseAuth.instance.currentUser?.reload();
    final user = FirebaseAuth.instance.currentUser;
    if (user!.emailVerified) {
       AuthenticationRepository.instance.setInitialScreen(user);
    }
  }
}
