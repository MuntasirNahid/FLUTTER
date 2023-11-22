import 'package:flutter/material.dart';

class categoryCard extends StatelessWidget {
  final String sub;
  const categoryCard({super.key, required this.sub});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 60,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade100,
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle // Adjust the radius as needed
          ),
      child: Center(
        child: Text(
          sub,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 10,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
