import 'package:authbased/src/constants/image_strings.dart';
import 'package:authbased/src/features/core/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class DashBoardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DashBoardAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.menu,
        color: Colors.black,
      ),
      title: Text(
        'FunZo',
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        GestureDetector(
          onTap: () {
            Get.to(() => ProfileScreen());
          },
          child: Flexible(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(
                top: 7,
                right: 20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //color: cardBgColor,
                color: Colors.blue,
              ),
              child: Image(
                image: AssetImage(welcomeScreenImage),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55);
}
