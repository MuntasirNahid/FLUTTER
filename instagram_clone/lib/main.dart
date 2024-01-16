import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/utills/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
      apiKey: "AIzaSyC31kUH0kBNxx-FXDoRWHA7CZ3nG7cZsk8",
      projectId: "instagram-clone-1f9f1",
      messagingSenderId: "685024612637",
      appId: "1:685024612637:web:c852f2268a51c3fe3d11f4",
      storageBucket: "instagram-clone-1f9f1.appspot.com",
    ));
  } else {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCVOiWFJF6C9YC28apRaL8tK3RXN_-B1NM",
        appId: "1:685024612637:android:e6ba8af6116d712b3d11f4",
        messagingSenderId: "685024612637",
        projectId: "instagram-clone-1f9f1",
        storageBucket: "instagram-clone-1f9f1.appspot.com",
      ),
    );
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram-clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      home: const LoginScreen(),
      // home: const ResponsiveLayout(
      //   webScreenLayout: WebScreenLayout(),
      //   mobileScreenLayout: MobileScreenLayout(),
      // ),
    );
  }
}
