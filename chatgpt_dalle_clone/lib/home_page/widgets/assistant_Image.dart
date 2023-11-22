

import 'package:animate_do/animate_do.dart';
import 'package:chatgpt_dalle/pallete.dart';
import 'package:flutter/material.dart';

class AssistantImage extends StatelessWidget {
  const AssistantImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Stack(
        children: [
          Center(
            child: Container(
              height: 120,
              width: 120,
              margin: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(
                color: Pallete.assistantCircleColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container(
            height: 123,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/virtualAssistant.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}