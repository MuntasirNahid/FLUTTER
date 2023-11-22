import 'package:authbased/src/constants/app_text.dart';
import 'package:authbased/src/constants/colors.dart';
import 'package:authbased/src/constants/image_strings.dart';
import 'package:authbased/src/features/core/screens/profile/update_profile_screen.dart';
import 'package:authbased/src/features/core/screens/profile/user_management_screen.dart';
import 'package:authbased/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final TextTheme txtTheme = Theme.of(context).textTheme;

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
          Profile,
          style: Theme.of(context).textTheme.headline4?.apply(
                fontWeightDelta: 2,
                color: Colors.black,
              ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
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
                        LineAwesomeIcons.alternate_pencil,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                ProfileHeading,
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                ProfileSubHeading,
                style: Theme.of(context).textTheme.bodyText2!.apply(
                      color: Colors.black,
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => UpdateProfileScreen());
                  },
                  child: Text(
                    editProfile,
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    side: BorderSide.none,
                    shape: StadiumBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              //as divider takes the full width, our screen goes to the center
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),

              ProfileMenuWidget(
                txtTheme: txtTheme,
                title: Menu1,
                icon: LineAwesomeIcons.cog,
                onPress: () {},
              ),
              ProfileMenuWidget(
                txtTheme: txtTheme,
                title: Menu2,
                icon: LineAwesomeIcons.wallet,
                onPress: () {},
              ),
              ProfileMenuWidget(
                txtTheme: txtTheme,
                title: Menu3,
                icon: LineAwesomeIcons.user_check,
                onPress: () {
                  Get.to(() => UserManagementScreen());
                },
              ),
              Divider(
                color: Colors.grey,
              ),
              SizedBox(
                height: 10,
              ),
              ProfileMenuWidget(
                txtTheme: txtTheme,
                title: Menu4,
                icon: LineAwesomeIcons.info,
                onPress: () {},
              ),
              ProfileMenuWidget(
                txtTheme: txtTheme,
                title: Menu5,
                icon: LineAwesomeIcons.alternate_sign_out,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  AuthenticationRepository.instance.logOut();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
