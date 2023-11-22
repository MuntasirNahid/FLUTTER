import 'package:authbased/src/constants/app_text.dart';
import 'package:authbased/src/constants/colors.dart';
import 'package:authbased/src/constants/image_strings.dart';
import 'package:authbased/src/features/authentication/screens/login/login_screen.dart';
import 'package:authbased/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    // var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? secondaryColor : primaryColor,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(welcomeScreenImage,
                height: MediaQuery.of(context).size.height * .50),
            Column(
              children: [
                Text(
                  welcomeText,
                  //  style: ThemeData().textTheme.displayLarge,
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  welcomeSubtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Get.to(() => LoginScreen()),
                    child: Text('Login'.toUpperCase()),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Get.to(
                      () => SignupScreen(),
                    ),
                    child: Text('Signup'.toUpperCase()),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
