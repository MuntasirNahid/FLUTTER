import 'package:flutter/material.dart';
import 'package:hackathon/constants/colors.dart';
import 'package:hackathon/constants/image_strings.dart';
import 'package:hackathon/screens/Experts/widgets/expert_list.dart';

class ExpertsScreen extends StatefulWidget {
  const ExpertsScreen({super.key});

  @override
  State<ExpertsScreen> createState() => _ExpertsScreenState();
}

String dropdownValue = 'All';

class _ExpertsScreenState extends State<ExpertsScreen> {
  void dropdownCallback(String? selectedValue) {
    setState(() {
      dropdownValue = selectedValue!;
    });
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
        title:const Text(
          'Experts',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DropdownButton(
                  isExpanded: false,
                  items: const [
                    DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'All',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      value: 'All',
                    ),
                    DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Physics',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      value: 'Physics',
                    ),
                    DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Chemistry',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      value: 'Chemistry',
                    ),
                    DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Biology',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      value: 'Biology',
                    ),
                    DropdownMenuItem(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Text(
                          'Math',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      value: 'Math',
                    ),
                  ],
                  value: dropdownValue,
                  onChanged: dropdownCallback,
                ),
                Icon(
                  Icons.filter_alt,
                  color: primaryColor,
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Physics',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ExpertWidget(
              expertName: 'Muntasir Mamun',
              expertIn: 'Physics',
              totalUpvote: '158',
              expertImage: studentPic,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Chemistry',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ExpertWidget(
              expertName: 'Muntasir Mamun',
              expertIn: 'Physics',
              totalUpvote: '158',
              expertImage: studentPic,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Biology',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ExpertWidget(
              expertName: 'Muntasir Mamun',
              expertIn: 'Physics',
              totalUpvote: '158',
              expertImage: studentPic,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Math',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ExpertWidget(
              expertName: 'Muntasir Mamun',
              expertIn: 'Physics',
              totalUpvote: '158',
              expertImage: studentPic,
            )
          ],
        ),
      ),
    );
  }
}
