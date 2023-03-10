import 'package:flutter/material.dart';

class ImageCliper extends CustomClipper<Path> {
  ImageCliper({required this.progress});
  final double progress;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addRect(
      Rect.fromLTRB(
          size.width - (size.width * progress), 0, size.width, size.height),
    );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
