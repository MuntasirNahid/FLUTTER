import 'package:flutter/material.dart';
import 'package:hackathon/constants/colors.dart';
import 'package:hackathon/constants/image_strings.dart';
import 'package:hackathon/screens/studentHomePage/widgets/studentAppBar.dart';

import 'widgets/adminDrawer.dart';
import 'widgets/toggleButtonChild.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<AdminHome> {
  List<bool> isSelected = List.generate(4, (index) => false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StudentAppbar(
        isNotificationAvailable: true,
        notificationCount: '2',
      ),
      drawer: const AdminDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ToggleButtons(
                selectedColor: primaryColor,
                isSelected: isSelected,
                children: [
                  //can remove any of these
                  toggleButtonChild(
                      isSelected: isSelected, label: 'Blogs', index: 0),
                  toggleButtonChild(
                      isSelected: isSelected, label: 'Posts', index: 1),
                  toggleButtonChild(
                      isSelected: isSelected, label: 'Experts', index: 2),
                  toggleButtonChild(
                      isSelected: isSelected, label: 'Students', index: 3),
                ],
                renderBorder: false,
                onPressed: (int index) {
                  setState(
                    () {
                      for (int buttonIndex = 0;
                          buttonIndex < isSelected.length;
                          buttonIndex++) {
                        isSelected[buttonIndex] = (buttonIndex == index);
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
