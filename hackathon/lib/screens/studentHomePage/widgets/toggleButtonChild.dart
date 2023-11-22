import 'package:flutter/material.dart';

class toggleButtonChild extends StatelessWidget {
  const toggleButtonChild({
    super.key,
    required this.isSelected,
    required this.label,
    required this.index,
  });

  final List<bool> isSelected;
  final String label;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected[index]
                ? Colors.transparent
                // ? Colors.black.withOpacity(0.5)
                : Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected[index] ? FontWeight.w700 : FontWeight.w400,
          fontSize: 17,
          // color: Colors.black,
        ),
      ),
    );
  }
}
