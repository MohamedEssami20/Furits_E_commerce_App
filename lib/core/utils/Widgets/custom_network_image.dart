import 'package:flutter/material.dart';

class CustomNetowrkImage extends StatelessWidget {
  const CustomNetowrkImage({
    super.key,
    required this.imageUrl, this.width,
  });

  final String imageUrl;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      width: width,
      imageUrl,
    );
  }
}
