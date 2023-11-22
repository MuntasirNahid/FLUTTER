import 'package:authbased/src/features/authentication/screens/forget_password/forget_password_mail/forget_password_mail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'forget_pw_button_widget.dart';

class forgetPasswordScreen {
  //we made it static to access it from anywhere without creating instance
  static Future<dynamic> forgetPasswordModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Make a Selection!',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Colors.black)),
            Text(
              'Select one of the option given below to reset your password.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 20,
            ),
            ForgetPwButtonWidget(
              btnIcon: Icons.email_outlined,
              onTap: () {
                navigator!.pop(context);
                Get.to(
                  () => ForgetPasswordMailScreen(),
                );
              },
              title: 'Email',
              subtitle: 'Reset via Email Verification',
            ),
            SizedBox(
              height: 20,
            ),
            ForgetPwButtonWidget(
              btnIcon: Icons.mobile_friendly_outlined,
              onTap: () {},
              title: 'Phone',
              subtitle: 'Reset via Phone number Verification',
            ),
          ],
        ),
      ),
    );
  }
}
