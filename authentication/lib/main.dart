import 'package:authbased/firebase_options.dart';
import 'package:authbased/src/repository/authentication_repository/authentication_repository.dart';
import 'package:authbased/src/utills/theme/widget_themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'src/features/authentication/screens/welcome/welcome_screen.dart';

Future<void> main() async {
  //to initialize firebase before running the app
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  //show splash screen till data loads & when loaded call FlutterNativeSplash.remove
  //which I handled in authenticationRepository
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //then firebase will be initialized and kick out authentication repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(
      AuthenticationRepository(),
    ),
  );

  //now run the app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: Duration(microseconds: 500),
      home: WelcomeScreen(),
    );
  }
}
