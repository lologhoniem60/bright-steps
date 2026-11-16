import 'package:flutter/material.dart';

class CurvedPanelClipper extends CustomClipper<Path> {
  const CurvedPanelClipper();

  @override
  Path getClip(Size size) => Path()
    ..moveTo(0, 0)
    ..lineTo(size.width * .67, 0)
    ..cubicTo(
      size.width * .86,
      0,
      size.width * .98,
      size.height * .1,
      size.width,
      size.height * .36,
    )
    ..lineTo(size.width, size.height)
    ..lineTo(0, size.height)
    ..close();

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
