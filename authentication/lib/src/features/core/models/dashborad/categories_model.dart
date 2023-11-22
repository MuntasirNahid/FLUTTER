import 'package:flutter/material.dart';

class DashboardCategoryModels {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPress;

  DashboardCategoryModels(
      this.title, this.heading, this.subHeading, this.onPress);

  static List<DashboardCategoryModels> list = [
    DashboardCategoryModels(
      'JS',
      'Java Script',
      '10 lessons',
      () {},
    ),
    DashboardCategoryModels(
      'F',
      'Flutter',
      '3 lessons',
      () {},
    ),
    DashboardCategoryModels(
      'D',
      'Dart',
      '2 lessons',
      () {},
    ),
  ];
}
