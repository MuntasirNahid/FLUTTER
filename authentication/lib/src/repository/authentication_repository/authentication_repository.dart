import 'package:authbased/src/features/authentication/screens/login/login_screen.dart';
import 'package:authbased/src/features/authentication/screens/mail_verification/mail_verification.dart';
import 'package:authbased/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:authbased/src/features/core/screens/dashboard/dashboard.dart';
import 'package:authbased/src/repository/authentication_repository/exception/signup_email_password_failure.dart';
import 'package:authbased/src/repository/authentication_repository/exception/t_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

//this handles the connection between firebase

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //All the authentication type item will be under our variables below
  final _auth = FirebaseAuth.instance;

  //this user must be inside a string.we can use string or we can use Rx from getX

  //we made our firebase user reactive using Rx, now it will act according to different situation like login or logout
  late final Rx<User?>
      firebaseUser; //now when our app is run,it will check whether our user is already logged in or not. if logged in it will redirect to dashboard

//this ready function will be called when authentication repository is ready/kicked from the main function
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth
        .currentUser); //this is our current user who is logged in or not logged in

    //this will always listen what user is doing, if it clickes logout button,it will inform the firebase and vice versa
    firebaseUser.bindStream(_auth.userChanges());

    //removing native splash
    FlutterNativeSplash.remove();

    //always ready for action
    //we will not use this , because when auto redirecting from authentication mail page,it will call forever and create a infinite loop
    // ever(firebaseUser, _setInitialScreen); //ever(listener,callback function)

    setInitialScreen(firebaseUser.value);
  }

  ///setting initial screen

  setInitialScreen(User? user) {
    //if user is null then it will remove all the prev screen and navigate it to welcome screen
    user == null
        ? Get.offAll(WelcomeScreen())
        : user.emailVerified
            ? Get.offAll(Dashboard())
            : Get.offAll(MailVerification());
  }

  /*------------------Email and Password Sign in---------------------------  */

  ///[EmailAuthentication]-LOGIN
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  ///[EmailAuthentication]-REGISTER
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      //redirecting to desired page
      firebaseUser.value != null
          ? Get.offAll(Dashboard())
          : Get.offAll(
              WelcomeScreen(),
            );
    } on FirebaseAuthException catch (e) {
      final ex = signUpEmailPasswordFailure.code(e.code);
      print('Firebase Auth exception - ${ex.message}');
      throw (ex);
    } catch (_) {
      final ex = signUpEmailPasswordFailure();
      print('Firebase Auth exception - ${ex.message}');
      throw (ex);
    }
  }

  ///[EmailVerification] -VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      //to throw custom message
      final ex = TException.code(e.code);
      throw ex.message;
    } catch (_) {
      final ex = TException();
      throw ex.message;
    }
  }

/*--------------------------------Federated identity and social sign-in */

  ///[GoogleAuthentication]

  Future<UserCredential?> signInWithGoogle() async {
    try {
// Trigger the authentication flow
//will give the popup menu with all the gmail account
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      // selecting one account
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      //it will create credential with that selected account
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      //to throw custom message
      final ex = TException.code(e.code);
      throw ex.message;
    } catch (_) {
      final ex = TException();
      throw ex.message;
    }
  }

  ///[FaceBookAuthentication]

  Future<UserCredential?> signInWithFacebook() async {}

  //logout
  Future<void> logOut() async {
    try {
      await GoogleSignIn().signOut();
      //await FacebookAuth.instance.logOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } on FormatException catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Unable to logout.Try again!';
    }
  }
}
