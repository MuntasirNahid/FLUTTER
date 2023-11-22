import 'package:flutter/material.dart';

class DallEResponse extends StatelessWidget {
  const DallEResponse({
    super.key,
    required this.generatedImageUrl,
  });

  final String? generatedImageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          generatedImageUrl!,
        ),
      ),
    );
  }
}
