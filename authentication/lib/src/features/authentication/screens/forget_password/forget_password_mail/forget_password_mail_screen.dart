import 'package:authbased/src/common_widgets/form/form_header_widget.dart';
import 'package:authbased/src/constants/image_strings.dart';
import 'package:authbased/src/features/authentication/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                FormHeaderWidget(
                  image: forgotPasswordImage,
                  title: 'Forgot Password',
                  subTitle: 'Give valid email address',
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    label: Text(
                      'Email',
                    ),
                    hintText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => OtpScreen());
                    },
                    child: Text(
                      'Next'.toUpperCase(),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
