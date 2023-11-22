import 'package:chatgpt_dalle/pallete.dart';
import 'package:flutter/material.dart';

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headingText;
  final String descText;

  const FeatureBox({
    super.key,
    required this.color,
    required this.headingText,
    required this.descText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
        ),
        child: Padding(
          padding:const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                headingText,
                style:const TextStyle(
                  fontFamily: 'Cera Pro',
                  fontSize: 18,
                  color: Pallete.blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  descText,
                  style:const TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Pallete.blackColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
