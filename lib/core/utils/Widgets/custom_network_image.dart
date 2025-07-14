import 'package:flutter/material.dart';

class CustomNetowrkImage extends StatelessWidget {
  const CustomNetowrkImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
    );
  }
}