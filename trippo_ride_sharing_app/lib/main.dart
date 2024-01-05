import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trippo_ride_sharing_app/splash_screen/splash_screen.dart';
import 'package:trippo_ride_sharing_app/theme_provider/theme_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCsOWOumpCQ5qYKF3DYGYlcB4DV1u6Z3BU",
      appId: "1:382787202355:android:d94a6157bb6fd9ab1f6246",
      messagingSenderId: "382787202355",
      projectId: "trippo-19e3e",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
