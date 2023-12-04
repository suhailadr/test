import 'package:flutter/material.dart';

class ProfileCustomClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0015234, size.height * 0.1817656);
    path_0.quadraticBezierTo(size.width * 0.2114299, size.height * 0.1858021,
        size.width * 0.2239907, size.height * 0.1810781);
    path_0.cubicTo(
        size.width * 0.2610187,
        size.height * 0.1722135,
        size.width * 0.2886916,
        size.height * 0.1452917,
        size.width * 0.3155794,
        size.height * 0.1300365);
    path_0.cubicTo(
        size.width * 0.3823925,
        size.height * 0.0881615,
        size.width * 0.4630841,
        size.height * 0.0837344,
        size.width * 0.5066355,
        size.height * 0.0828490);
    path_0.cubicTo(
        size.width * 0.5492523,
        size.height * 0.0835260,
        size.width * 0.6270374,
        size.height * 0.0873385,
        size.width * 0.6912804,
        size.height * 0.1300365);
    path_0.cubicTo(
        size.width * 0.7244206,
        size.height * 0.1466823,
        size.width * 0.7484579,
        size.height * 0.1720938,
        size.width * 0.7828692,
        size.height * 0.1810781);
    path_0.quadraticBezierTo(size.width * 0.8006636, size.height * 0.1857708,
        size.width * 0.9996916, size.height * 0.1821198);
    path_0.lineTo(size.width * 0.9996916, size.height * -0.0012135);
    path_0.lineTo(size.width * 0.0015421, size.height * -0.0012083);
    path_0.lineTo(size.width * -0.0015234, size.height * 0.1817656);
    path_0.close();

    return path_0;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
