import 'package:flutter/material.dart';
import 'package:hackathon/constants/colors.dart';
import 'package:hackathon/constants/image_strings.dart';
import 'package:hackathon/screens/studentProfile/widgets/courses_List.dart';
import 'package:hackathon/screens/studentProfile/widgets/edit_profile_content.dart';
import 'package:hackathon/screens/studentHomePage/widgets/toggleButtonChild.dart';
import 'package:hackathon/screens/studentViewTeacherProfile/widgets/teacher_courses_List.dart';
import 'package:hackathon/screens/teacherProfile/widgets/teacher_courses_List.dart';
import 'package:hackathon/utills/blog_card.dart';

class StudentViewTeacherProfile extends StatefulWidget {
  const StudentViewTeacherProfile({super.key});

  @override
  State<StudentViewTeacherProfile> createState() =>
      _StudentViewTeacherProfileState();
}

class _StudentViewTeacherProfileState extends State<StudentViewTeacherProfile> {
  List<bool> isSelected = List.generate(2, (index) => false);

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
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  child: Image.asset(
                    studentPic,
                    height: 70,
                    width: 70,
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
                height: 2,
              ),
              Center(
                child: Text(
                  'Expert of Physics',
                ),
              ),

              SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  'Total Blogs: 2 .   Total Courses: 5',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  width: 240,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.lock),
                        Text(
                          'Message',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
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
                          isSelected: isSelected, label: 'Blogs', index: 0),
                      toggleButtonChild(
                          isSelected: isSelected, label: 'Courses', index: 1),
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
                height: 20,
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
                Scrollbar(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.47,
                    child: StudentViewTeacherCourseList(),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
