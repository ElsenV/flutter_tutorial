import 'package:app_tutorial/src/models/line_side_enum.dart';
import 'package:flutter/material.dart';
import 'package:app_tutorial/src/models/shape_model_enum.dart';

/// A class that holds the data of the shapes
class HolePainter extends CustomPainter {
  final double dx;
  final double dy;
  final double width;
  final double height;
  final Color color;
  final Radius borderRadius;
  final ShapeFocus shapeFocus;
  final double? radius;
  final TutorialSideEnum? lineSide;
  final double lineLength;
  final double lineWidth;

  /// A constructor that takes in the data of the shape
  HolePainter({
    required this.dx,
    required this.dy,
    required this.width,
    required this.height,
    required this.color,
    required this.radius,
    required this.borderRadius,
    this.shapeFocus = ShapeFocus.oval,
    required this.lineSide,
    required this.lineLength,
    required this.lineWidth,
  });

  @override

  /// A method that paints the shape
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    Paint borderPaint = Paint()
      ..color = Colors.white // Border rengi
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    late Paint linePoint;

    linePoint = Paint()
      ..color = Colors.white // Border rengi
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth;

    if (shapeFocus == ShapeFocus.oval) {
      canvas.drawPath(
          Path.combine(
            PathOperation.difference,
            Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
            Path()
              ..addOval(Rect.fromCircle(
                  center: Offset(dx, dy), radius: radius ?? width))
              ..close(),
          ),
          paint);
      if (lineSide == TutorialSideEnum.empty) return;
      canvas.drawPath(
        Path()
          ..addOval(
              Rect.fromCircle(center: Offset(dx, dy), radius: radius ?? width))
          ..close(),
        borderPaint,
      );
      late double start;
      late double end;
      if (lineSide == TutorialSideEnum.bottom) {
        start = dy + (radius ?? width); // Ovalin üst kısmı
        end = dy +
            (radius != null
                ? (radius! * lineLength)
                : (width * lineLength)); // Ovalin alt kısmı
      } else if (lineSide == TutorialSideEnum.top) {
        start = dy - (radius ?? width); // Ovalin alt kısmı
        end = dy -
            (radius != null
                ? (radius! * lineLength)
                : (width * lineLength)); // Ovalin üst kısmı
      } else if (lineSide == TutorialSideEnum.left) {
        print('LEFT Dx ${dx} dy $dy ');

        start = dx - (radius ?? width); // Ovalin sol kısmı
        end = dx -
            (radius != null ? (radius! * lineLength) : (width * lineLength));

        ; // Ovalin sol uzanti kısmı
      } else if (lineSide == TutorialSideEnum.right) {
        print('Right Dx ${dx} dy $dy ');
        start = dx + (radius ?? width); // Ovalin sag kısmı
        end = dx +
            (radius != null
                ? (radius! * lineLength)
                : (width * lineLength)); // Ovalin sag uzanti kısmı
      }

      // top-bottom
      if (lineSide == TutorialSideEnum.bottom ||
          lineSide == TutorialSideEnum.top) {
        canvas.drawLine(
          Offset(dx, start),
          Offset(dx, end),
          linePoint,
        );
      } else {
        canvas.drawLine(
          Offset(start, dy),
          Offset(end, dy),
          linePoint,
        );
      }
    } else if (shapeFocus == ShapeFocus.roundedSquare) {
      canvas.drawPath(
          Path.combine(
            PathOperation.difference,
            Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
            Path()
              ..addRRect(RRect.fromRectAndCorners(
                Rect.fromLTWH(
                  dx - (width / 2),
                  dy - (height / 2),
                  width,
                  height,
                ),
                topRight: borderRadius,
                topLeft: borderRadius,
                bottomRight: borderRadius,
                bottomLeft: borderRadius,
              ))
              ..close(),
          ),
          paint);
    } else {
      canvas.drawPath(
          Path.combine(
            PathOperation.difference,
            Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
            Path()
              ..addRect(Rect.fromLTWH(
                  dx - (width / 2), dy - (height / 2), width, height))
              ..close(),
          ),
          paint);
    }
  }

  @override

  /// A method that returns whether the shape is a custom shape or not
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
