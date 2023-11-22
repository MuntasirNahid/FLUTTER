import 'package:authbased/src/constants/image_strings.dart';
import 'package:authbased/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login_Footer_Widget extends StatelessWidget {
  const Login_Footer_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('OR'),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Image(
                image: AssetImage(welcomeScreenImage),
                width: 30.0,
              ),
              label: Text('Sign-In with Google'),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
            onPressed: () {
              Get.to(() => SignupScreen());
            },
            child: Text.rich(
              TextSpan(
                text: "Don't have an account?",
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(
                    text: "Signup",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
