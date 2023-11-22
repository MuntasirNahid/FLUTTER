import 'package:authbased/src/constants/app_text.dart';
import 'package:flutter/material.dart';

class DashBoardSearchBox extends StatelessWidget {
  const DashBoardSearchBox({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.7),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        prefixIcon: Icon(
          Icons.mic,
        ),
      ),
    );
  }
}
