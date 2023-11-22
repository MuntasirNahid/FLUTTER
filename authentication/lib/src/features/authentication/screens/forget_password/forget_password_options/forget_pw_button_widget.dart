import 'package:flutter/material.dart';

class ForgetPwButtonWidget extends StatelessWidget {
  final title, subtitle;
  final IconData btnIcon;
  final VoidCallback onTap;
  const ForgetPwButtonWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.btnIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[400],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              btnIcon,
              size: 60.0,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
