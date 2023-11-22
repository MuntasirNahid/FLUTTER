import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/utills/category_card.dart';

class BlogCard extends StatelessWidget {
  final String imagePath;
  final String authorName;
  final String title;
  final String subtitle;
  final String blogImagePath;
  final List<String> tags;
  final BuildContext rootContext;
  final void Function() onremoveTap;
  final void Function() takeToAuthorProfile;
  final double width;

  const BlogCard(
      {super.key,
      required this.imagePath,
      required this.authorName,
      required this.title,
      required this.subtitle,
      required this.blogImagePath,
      required this.tags,
      required this.rootContext,
      required this.onremoveTap,
      required this.takeToAuthorProfile,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        padding: EdgeInsets.all(5),
        height: 200,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: takeToAuthorProfile,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 5, 0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(imagePath),
                        radius: 20,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        authorName,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text(
                        title,
                        style: TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
// Set wrap to true to allow text to wrap to the next line
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset(
                        blogImagePath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      height: 40,
                      width: 230,
                      child: SingleChildScrollView(
                        child: Text(
                          subtitle,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade600),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 32,
                    width: width - 100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        direction: Axis.horizontal,
                        alignment: WrapAlignment.start,
                        spacing:
                            2.0, // Adjust the spacing between items as needed
                        children: tags.map((tag) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                right: 2.0), // Add spacing between items
                            child: categoryCard(sub: tag),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  GestureDetector(
                      onTap: onremoveTap,
                      child: Container(
                          width: 50, child: Icon(Icons.remove_circle_outline)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
