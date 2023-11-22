import 'package:animate_do/animate_do.dart';
import 'package:chatgpt_dalle/pallete.dart';
import 'package:flutter/material.dart';

class FeatureText extends StatelessWidget {
  const FeatureText({
    super.key,
    required this.generatedContent,
    required this.generatedImageUrl,
  });

  final String? generatedContent;
  final String? generatedImageUrl;

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      child: Visibility(
        visible: generatedContent == null && generatedImageUrl == null,
        child: const Padding(
          padding: EdgeInsets.fromLTRB(24, 10, 0, 0),
          child: Text(
            'Here are a few features',
            style: TextStyle(
              fontFamily: 'Cera Pro',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Pallete.mainFontColor,
            ),
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}