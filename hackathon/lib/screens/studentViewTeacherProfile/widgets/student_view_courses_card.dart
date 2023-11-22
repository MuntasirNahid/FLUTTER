import 'package:hackathon/constants/colors.dart';
import 'package:hackathon/constants/image_strings.dart';
import 'package:flutter/material.dart';

Map<int, String> subjectImages = {
  1: mathsPic,
  2: sciencePic,
  3: biologyPic,
  4: mathematicsPic,
  5: physicsPic,
};

class StudentViewCoursesCard extends StatelessWidget {
  final String lessonName;
  final String teacherName;

  final int idx;

  const StudentViewCoursesCard({
    super.key,
    required this.lessonName,
    required this.teacherName,
    required this.idx,
  });

  @override
  Widget build(BuildContext context) {
    String subjectImage = subjectImages[idx % 5] ?? sciencePic;
    return Container(
      decoration: ShapeDecoration(
        color: idx % 2 == 0 ? Color(0x35E8914F) : Color(0x35FB95E1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(18, 18, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              subjectImage,
              height: 40,
              width: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 13.0),
              child: Text(
                lessonName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'By ${teacherName}',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: 05,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 25,
                width: 125,
                decoration: BoxDecoration(
                  color: primaryColor,
                  border: Border.all(
                    width: 1,
                    style: BorderStyle.none,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Apply',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
