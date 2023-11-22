import 'package:authbased/src/constants/app_text.dart';
import 'package:authbased/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'widgets/appBar.dart';
import 'widgets/banners.dart';
import 'widgets/categories.dart';
import 'widgets/search_box.dart';
import 'widgets/top_courses.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
//variable
    final txtTheme = Theme.of(context).textTheme;
//in total 620 line
    return Scaffold(
      appBar: DashBoardAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DashboardTitle,
                style: txtTheme.bodyText2!.copyWith(
                  color: Colors.black,
                ),
              ),
              Text(
                DashboardHeading,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: dashBoardPadding,
              ),

              //Search Box//
              DashBoardSearchBox(txtTheme: txtTheme),
              SizedBox(
                height: dashBoardPadding,
              ),

              //categories

              DashBoardCategories(txtTheme: txtTheme),

              SizedBox(
                height: 10,
              ),

              //banners
              DashBoardBanners(txtTheme: txtTheme),

              SizedBox(
                height: dashBoardPadding,
              ),
              //Top Courses
              Text(
                'Top Courses',
                style: txtTheme.headline5?.apply(
                  fontSizeFactor: 1.2,
                  fontWeightDelta: 2,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DashBoradTopCourses(txtTheme: txtTheme),
            ],
          ),
        ),
      ),
    );
  }
}
