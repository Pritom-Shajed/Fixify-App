
import 'package:flutter/material.dart';

class AuthClip extends CustomClipper<Path> {
  bool flipped;
  AuthClip({this.flipped = false});

  @override
  Path getClip (Size size){
    var roundnessFactor = 50.0;
    final path = Path();
    if(flipped == false) {
      path.moveTo(size.width, size.height * 0.33);
      path.lineTo(size.width, size.height - roundnessFactor);
      path.quadraticBezierTo(
          size.width, size.height, size.width - roundnessFactor, size.height);
      path.lineTo(roundnessFactor, size.height);
      path.quadraticBezierTo(0, size.height, 0, size.height - roundnessFactor);
      path.lineTo(0, roundnessFactor * 2);
      path.quadraticBezierTo(
          10, roundnessFactor, roundnessFactor * 1.5, roundnessFactor * 1.5);
      path.lineTo(size.width - roundnessFactor * 0.6,
          size.height * 0.33 - roundnessFactor * 0.3);
      path.quadraticBezierTo(
          size.width, size.height * 0.33, size.width, size.height * 0.33 + roundnessFactor);
    } else {
      path.moveTo(0, size.height * 0.33);
      path.lineTo(0, size.height - roundnessFactor);
      path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
      path.lineTo(size.width - roundnessFactor, size.height);
      path.quadraticBezierTo(
          size.width, size.height, size.width, size.height - roundnessFactor);
      path.lineTo(size.width, roundnessFactor * 2);
      path.quadraticBezierTo(size.width - 10, roundnessFactor,
          size.width - roundnessFactor * 1.5, roundnessFactor * 1.5);
      path.lineTo(
          roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);
      path.quadraticBezierTo(
          0, size.height * 0.33, 0, size.height * 0.33 + roundnessFactor);

    }

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}