import 'package:flutter/material.dart';
import 'package:zoom_clone/utills/colors.dart';

class MeetingOptions extends StatelessWidget {
  const MeetingOptions(
      {super.key,
      required this.text,
      required this.isMuted,
      required this.onChange});

  final String text;
  final bool isMuted;
  final Function(bool) onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            Switch.adaptive(value: isMuted, onChanged: onChange)
          ],
        ),
      ),
    );
  }
}
