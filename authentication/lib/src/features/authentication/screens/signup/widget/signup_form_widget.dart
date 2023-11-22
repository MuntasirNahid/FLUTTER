import 'package:authbased/src/features/authentication/controllers/signup_controller.dart';
import 'package:authbased/src/features/authentication/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: InputDecoration(
                label: Text("Full Name"),
                hintText: "Full Name",
                prefixIcon: Icon(
                  Icons.person_outline_outlined,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controller.email,
              decoration: InputDecoration(
                label: Text("Email"),
                hintText: "Email",
                prefixIcon: Icon(
                  Icons.email,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controller.phoneNo,
              decoration: InputDecoration(
                label: Text("Phone Number"),
                hintText: "Phone Number",
                prefixIcon: Icon(
                  Icons.phone_android,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: controller.password,
              decoration: InputDecoration(
                label: Text("Password"),
                hintText: "Password",
                prefixIcon: Icon(
                  Icons.fingerprint,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  //if the validation is passed ,we will send it to signupUser function of signupcontroller
                  if (_formKey.currentState!.validate()) {
                   
                    /* email and password authentication */

                    SignUpController.instance.registerUser(
                      controller.email.text.trim(),
                      controller.password.text.trim(),
                    );

                    //store in database
                    final user = UserModel(
                      fullName: controller.fullName.text.trim(),
                      phoneNo: controller.phoneNo.text.trim(),
                      email: controller.email.text.trim(),
                      password: controller.password.text.trim(),
                    );

                    SignUpController.instance.createUser(user);
                  }
                },
                child: Text(
                  'Signup'.toUpperCase(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
