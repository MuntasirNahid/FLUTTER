import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  //const HeadingText({super.key});
  final String headingText;
  const HeadingText({super.key, required this.headingText});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width - 50,
      child: Text(
        headingText,
        style: TextStyle(
          fontFamily: "Poppins",
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
