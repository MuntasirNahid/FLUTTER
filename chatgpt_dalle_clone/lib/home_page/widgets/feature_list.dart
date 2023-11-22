import 'package:animate_do/animate_do.dart';
import 'package:chatgpt_dalle/feature-box.dart';
import 'package:chatgpt_dalle/pallete.dart';
import 'package:flutter/material.dart';

class FeatureLists extends StatelessWidget {
  const FeatureLists({
    super.key,
    required this.generatedContent,
    required this.generatedImageUrl,
    required this.start,
    required this.delay,
  });

  final String? generatedContent;
  final String? generatedImageUrl;
  final int start;
  final int delay;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: generatedContent == null && generatedImageUrl == null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SlideInLeft(
            delay: Duration(milliseconds: start),
            child: const FeatureBox(
              headingText: 'ChatGPT',
              descText:
                  'A Smarter way to stay organized and informed with ChatGPT',
              color: Pallete.firstSuggestionBoxColor,
            ),
          ),
          SlideInLeft(
            delay: Duration(milliseconds: start + delay),
            child: const FeatureBox(
              headingText: 'Dall-E',
              descText:
                  'Get Inspired and stay creative with your personal assistant powered by Dall-E',
              color: Pallete.secondSuggestionBoxColor,
            ),
          ),
          SlideInLeft(
            delay: Duration(microseconds: start + 2 * delay),
            child: const FeatureBox(
              headingText: 'Smart Voice Assistant',
              descText:
                  'Get the best of both worlds with a voice assistant powered by Dall-E and ChatGPT',
              color: Pallete.thirdSuggestionBoxColor,
            ),
          ),
        ],
      ),
    );
  }
}