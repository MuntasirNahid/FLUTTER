import 'package:flutter/material.dart';
import 'package:hackathon/constants/colors.dart';
import 'package:hackathon/constants/image_strings.dart';
import 'package:hackathon/screens/studentHomePage/widgets/studentAppBar.dart';

import 'widgets/teacherDrawer.dart';
import 'widgets/toggleButtonChild.dart';

class TeacherHome extends StatefulWidget {
  const TeacherHome({Key? key}) : super(key: key);

  @override
  State<TeacherHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<TeacherHome> {
  List<bool> isSelected = List.generate(6, (index) => false);

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
      drawer: const teacherDrawer(
        userName: 'Muntasir Mamun',
        userEmail: 'nahid@gmail.com',
        picturePath: studentPic,
      ),
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
                  toggleButtonChild(
                      isSelected: isSelected, label: 'Blogs', index: 0),
                  toggleButtonChild(
                      isSelected: isSelected, label: 'Posts', index: 1),
                  toggleButtonChild(
                      isSelected: isSelected, label: 'Physics', index: 2),
                  toggleButtonChild(
                      isSelected: isSelected, label: 'Chemistry', index: 3),
                  toggleButtonChild(
                      isSelected: isSelected, label: 'Math', index: 4),
                  toggleButtonChild(
                      isSelected: isSelected, label: 'Biology', index: 5),
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
