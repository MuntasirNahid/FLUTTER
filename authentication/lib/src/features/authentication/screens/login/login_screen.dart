import 'package:authbased/src/constants/image_strings.dart';
import 'package:flutter/material.dart';

import 'widgets/login_footer_widget.dart';
import 'widgets/login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(welcomeScreenImage),
                  height: size.height * .2,
                ),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  'Make it fast,Make it quick,Make it right ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                LoginForm(),
                Login_Footer_Widget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
