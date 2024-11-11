import 'dart:math';

import 'package:flutter/material.dart';

class StoryUnviewedProfilePicturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final strokeWidth = pow(size.shortestSide, 1 / 4).toDouble() / 1.5;
    final radius = size.shortestSide / 2 - (strokeWidth / 2);
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..shader = LinearGradient(
        colors: [
          Color(0xFFFBAA47),
          Color(0xFFD91A46),
          Color(0xFFA60F93),
        ],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ).createShader(Rect.fromCenter(
          center: center, width: radius * 2, height: radius * 2));
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class StoryViewedProfilePicturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final strokeWidth = pow(size.shortestSide, 1 / 4).toDouble() / 1.5;
    final radius = size.shortestSide / 2 - (strokeWidth / 2);
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = const Color(0xFFC7C7CC);
    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}

class MultipleFriendsProfilePicturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) async {
    final paint = Paint()
      ..color = const Color(0xFFEFEFEF)
      ..style = PaintingStyle.fill;

    final paint2 = Paint()..color = Colors.red;

    final radius = size.height / 2;
    final center1 = Offset(size.width * (1 / 3), size.height / 2);
    final maskCenter = Offset(size.width * (1 / 3) + 3, size.height / 2);
    final center2 = Offset(size.width * (2 / 3), size.height / 2);

// Calculate angles in radians
    final circleAngle = acos(
      ((radius * radius +
              (maskCenter.dx - center2.dx).abs() *
                  (maskCenter.dx - center2.dx).abs() -
              radius * radius) /
          (2 * radius * (maskCenter.dx - center2.dx).abs())),
    );
    final maskAngle = asin(radius * sin(circleAngle) / radius);
    final maskCircleStartAngle = (2 * pi) - maskAngle;
    final maskCircleSweepAngle = 2 * maskAngle;
    final circleStartAngle = pi + circleAngle;
    final circleSweepAngle = (2 * pi) - (2 * circleAngle);

    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addArc(
        Rect.fromCircle(center: center2, radius: radius),
        circleStartAngle,
        circleSweepAngle,
      )
      ..addArc(
        Rect.fromCircle(center: maskCenter, radius: radius),
        maskCircleStartAngle,
        maskCircleSweepAngle,
      );

    canvas.drawPath(path, paint2);

// Clip before drawing
    canvas.clipRRect(
      RRect.fromRectAndRadius(
        Rect.fromCircle(center: center1, radius: radius),
        Radius.circular(radius),
      ),
    );

    canvas.drawRect(
      Rect.fromCircle(center: center1, radius: radius),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class CollabProfilePicturePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = const Color(0xFFEFEFEF);
    final paint2 = Paint()..color = Colors.red
        //..style = PaintingStyle.stroke
        ;
    final radius = size.height / 2;
    final radius2 = size.height / 2 + 1;
    final center1 = Offset(size.width * (1 / 3), size.height * (2 / 3));
    final center2 = Offset(size.width * (2 / 3), size.height * (1 / 3));
    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addArc(
          Rect.fromCircle(center: center1.translate(1, -1), radius: radius2),
          1.5 * pi - 0.3,
          0.7 * pi + 0.05)
      ..addArc(Rect.fromCircle(center: center2.translate(1, 0), radius: radius),
          pi, 1.5 * pi);
    canvas.drawPath(path, paint2);
    canvas.clipRRect(RRect.fromRectAndRadius(
        Rect.fromCircle(center: center1, radius: radius),
        Radius.circular(radius)));

    canvas..drawRect(Rect.fromCircle(center: center1, radius: radius), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
