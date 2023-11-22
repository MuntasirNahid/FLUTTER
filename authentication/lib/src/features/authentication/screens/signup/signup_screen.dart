import 'package:authbased/src/common_widgets/form/form_header_widget.dart';
import 'package:authbased/src/constants/image_strings.dart';
import 'package:flutter/material.dart';

import 'widget/signup_footer.dart';
import 'widget/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                FormHeaderWidget(
                  image: welcomeScreenImage,
                  title: "Get on Board",
                  subTitle: 'Make it fast,Make it quick,Make it right ',
                ),
                SizedBox(
                  height: 20,
                ),
                SignUpForm(),
                SizedBox(
                  height: 5,
                ),
                SignUpFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
