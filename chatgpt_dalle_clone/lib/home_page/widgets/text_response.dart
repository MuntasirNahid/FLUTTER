import 'package:animate_do/animate_do.dart';
import 'package:chatgpt_dalle/pallete.dart';
import 'package:flutter/material.dart';

class TextResponse extends StatelessWidget {
  const TextResponse({
    super.key,
    required this.generatedImageUrl,
    required this.generatedContent,
  });

  final String? generatedImageUrl;
  final String? generatedContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: FadeInRight(
        child: Visibility(
          visible: generatedImageUrl == null,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Pallete.borderColor,
              ),
              borderRadius: BorderRadius.circular(20).copyWith(
                topLeft: Radius.zero,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Text(
                generatedContent == null
                    ? 'Good Morning! What task can I do for you?'
                    : generatedContent!,
                style: TextStyle(
                  fontFamily: 'Cera Pro',
                  color: Pallete.mainFontColor,
                  fontSize: generatedContent == null ? 25 : 18,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
