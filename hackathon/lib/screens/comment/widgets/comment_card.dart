import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/utills/category_card.dart';

class commentCard extends StatelessWidget {
  final String imagePath;
  final String authorName;
  final String content;
  final BuildContext rootContext;

  final String upVoteCount;
  final double width;

  const commentCard({
    super.key,
    required this.imagePath,
    required this.authorName,
    required this.rootContext,
    required this.width,
    required this.content,
    required this.upVoteCount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        padding: EdgeInsets.all(5),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
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
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Container(
                      height: 40,
                      width: 230,
                      child: SingleChildScrollView(
                        child: Text(
                          content,
                          softWrap: true,
                          maxLines: 3,
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.thumb_up,
                  ),
                  SizedBox(
                    width: 05,
                  ),
                  Text(upVoteCount),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
