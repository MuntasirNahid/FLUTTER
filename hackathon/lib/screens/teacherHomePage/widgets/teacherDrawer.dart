import 'package:flutter/material.dart';

class teacherDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final String picturePath;
  const teacherDrawer({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.picturePath,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
            accountName: Text(
              userName,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            accountEmail: Text(
              userEmail,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            currentAccountPicture: CircleAvatar(
              child: Image.asset(picturePath),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.person),
            title: Text(
              'Profile',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.message),
            title: Text(
              'Messages',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.question_mark),
            title: Text(
              'Approval',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 330,
          ),
          ListTile(
            onTap: () {},
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.red,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
