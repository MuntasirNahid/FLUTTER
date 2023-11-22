import 'package:authbased/src/features/authentication/screens/forget_password/forget_password_options/forget_pow_modal_bottom_sheet.dart';
import 'package:authbased/src/features/core/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              decoration: InputDecoration(
                label: Text("Email"),
                hintText: "Email",
                prefixIcon: Icon(Icons.person_outline_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text("Password"),
                hintText: "Password",
                prefixIcon: Icon(Icons.fingerprint),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: null,
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),
            SizedBox(
              height: 07,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  forgetPasswordScreen.forgetPasswordModalBottomSheet(context);
                },
                child: Text('Forgot Password?'),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => Dashboard());
                },
                child: Text('Login'.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
