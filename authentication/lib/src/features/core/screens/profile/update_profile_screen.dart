import 'package:authbased/src/constants/app_text.dart';
import 'package:authbased/src/constants/colors.dart';
import 'package:authbased/src/constants/image_strings.dart';
import 'package:authbased/src/features/authentication/models/user_model.dart';
import 'package:authbased/src/features/core/controllers/profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            LineAwesomeIcons.arrow_left,
            color: Colors.black,
          ),
        ),
        title: Text(
          editProfile,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.apply(fontWeightDelta: 2, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              //data is fetched successfully
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;

                  //controller
                  final emailController =
                      TextEditingController(text: userData.email);
                  final passwordController =
                      TextEditingController(text: userData.password);
                  final fullNameController =
                      TextEditingController(text: userData.fullName);
                  final phoneNoController =
                      TextEditingController(text: userData.phoneNo);

                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.asset(
                                profileImage,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Icon(
                                LineAwesomeIcons.camera,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: [
                          TextFormField(
                            controller: fullNameController,
                            //controller and initial value cannot be used at a time
                            //  initialValue: userData.fullName,
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
                            controller: emailController,
                            //initialValue: userData.email,
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
                            controller: phoneNoController,
                            // initialValue: userData.phoneNo,
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
                            controller: passwordController,
                            obscureText: true,
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
                              onPressed: () async {
                                final userData = UserModel(
                                  fullName: fullNameController.text.trim(),
                                  phoneNo: phoneNoController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                );
                                bool success =
                                    await controller.updateRecord(userData);

                                if (success) {
                                  Get.snackbar(
                                      'Success', "Updated Successfully");
                                } else {
                                  Get.snackbar(
                                      'Error', "Something Error Occured");
                                }
                              },
                              child: Text('Update Profile'),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: tJoined,
                                  style: TextStyle(fontSize: 12),
                                  children: [
                                    TextSpan(
                                      text: tJoinedAt,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: Text(
                                  tDelete,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return Center(
                    child: Text('Something Went Wrong'),
                  );
                }
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
