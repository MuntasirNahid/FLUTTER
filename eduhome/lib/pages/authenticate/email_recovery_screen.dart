import 'package:ui_ux/constants/input_decoration.dart';
import 'package:ui_ux/pages/authenticate/reset_student_email_sent_screen.dart';
import 'package:ui_ux/pages/authenticate/reset_tutor_email_sent_screen.dart';
import 'package:ui_ux/services/authenticate/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailRecovery extends StatefulWidget {
  const EmailRecovery({super.key});

  @override
  State<EmailRecovery> createState() => _EmailRecoveryState();
}

class _EmailRecoveryState extends State<EmailRecovery> {
  final emailValue = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailValue.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CircleAvatar(
                      minRadius: 150,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/forgotPassword2.png"),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Forgot Password!",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ),
                Text(
                  "Try Recovery With Email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins"),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    Container(
                      decoration: containerDecoration,
                      height: 50,
                      width: MediaQuery.of(context).size.width - 30,
                      child: TextFormField(
                        decoration: inputDecoration.copyWith(
                            prefixIcon: Icon(
                              Icons.mail_outline_rounded,
                              color: Colors.grey.shade400,
                            ),
                            label: Text("E-Mail"),
                            hintText: "E-Mail"),
                        controller: emailValue,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 42,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(int.parse("#00CC99".substring(1, 7),
                                    radix: 16) +
                                0xFF000000),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0))),
                        onPressed: () {
                          //
                          final userTypeValue = AuthenticationRepository
                              .instance.userType.value
                              .toString()
                              .toLowerCase();
                          AuthenticationRepository.instance
                              .resetPassword(emailValue.text.trim());
                          if (userTypeValue == 'tutor') {
                            Get.offAll(() => ResetTutorEmailSentScreen(
                                email: emailValue.text.trim()));
                          } else {
                            Get.offAll(() => ResetStudentEmailSentScreen(
                                email: emailValue.text.trim()));
                          }
                        },
                        child: Text(
                          "NEXT",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
