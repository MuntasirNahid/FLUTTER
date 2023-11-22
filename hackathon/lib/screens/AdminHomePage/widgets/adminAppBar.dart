import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon/constants/colors.dart';

class StudentAppbar extends StatelessWidget implements PreferredSizeWidget {
  final bool isNotificationAvailable;
  final String notificationCount;

  const StudentAppbar({
    super.key,
    required this.isNotificationAvailable,
    required this.notificationCount,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Home',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 15, 0),
          child: badges.Badge(
            badgeContent: isNotificationAvailable
                ? Text(
                    notificationCount,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                : null,
            child: Icon(Icons.notifications_none),
            position: badges.BadgePosition.topEnd(),
            badgeStyle: badges.BadgeStyle(
              badgeColor: notificationIconColor,
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(55);
}
