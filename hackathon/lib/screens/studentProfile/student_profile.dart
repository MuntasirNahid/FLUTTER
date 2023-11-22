import 'package:flutter/material.dart';
import 'package:hackathon/constants/colors.dart';
import 'package:hackathon/constants/image_strings.dart';
import 'package:hackathon/screens/studentProfile/widgets/courses_List.dart';
import 'package:hackathon/screens/studentProfile/widgets/edit_profile_content.dart';
import 'package:hackathon/screens/studentHomePage/widgets/toggleButtonChild.dart';
import 'package:hackathon/utills/blog_card.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({super.key});

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  List<bool> isSelected = List.generate(3, (index) => false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected[1] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  child: Image.asset(
                    studentPic,
                  ),
                  minRadius: 50,
                  backgroundColor: Colors.grey.withOpacity(0.2),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Muntasir Mamun ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  'Total Posts: 2 .   Courses Enrolled: 5',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ToggleButtons(
                    selectedColor: primaryColor,
                    isSelected: isSelected,
                    children: [
                      toggleButtonChild(
                          isSelected: isSelected, label: 'Posts', index: 0),
                      toggleButtonChild(
                          isSelected: isSelected, label: 'Courses', index: 1),
                      toggleButtonChild(
                          isSelected: isSelected,
                          label: 'Edit Profile',
                          index: 2),
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
                ],
              ),
              SizedBox(
                height: 30,
              ),
              if (isSelected[0])
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      BlogCard(
                        imagePath: studentPic,
                        authorName: 'Muntasir Mamun',
                        title: 'Hello Brother',
                        subtitle: 'Helllo guysssssss',
                        blogImagePath: scienceBanner,
                        tags: ['Science'],
                        rootContext: context,
                        onremoveTap: () {},
                        takeToAuthorProfile: () {},
                        width: MediaQuery.of(context).size.width,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: BlogCard(
                          imagePath: studentPic,
                          authorName: 'Tahmid Kabir',
                          title: 'Hello Brother',
                          subtitle: 'Helllo guysssssss',
                          blogImagePath: scienceBanner,
                          tags: ['Science'],
                          rootContext: context,
                          onremoveTap: () {},
                          takeToAuthorProfile: () {},
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ],
                  ),
                ), // Sho

              if (isSelected[1])
                Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: CourseList()),
              // Show Courses content when index is 1
              if (isSelected[2]) StudentEditProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
