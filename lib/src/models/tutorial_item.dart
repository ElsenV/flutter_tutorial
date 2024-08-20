import 'package:app_tutorial/src/models/line_side_enum.dart';
import 'package:flutter/material.dart';
import 'package:app_tutorial/src/models/shape_model_enum.dart';

/// This is the class that will be used to create the shapes
class TutorialItem {
  final GlobalKey globalKey;
  final ShapeFocus shapeFocus;
  final Widget child;
  final double? radius; // for oval shape
  final Color color;
  final Radius borderRadius;
  final TutorialSideEnum lineSide;
  final double lineLength;
  final double lineWidth;
  final double right;
  final double top;
  final bool showSkip;
  final double topSkipBtn;
  final VoidCallback? setSkipBtn;
  final Widget? skipBtnWidget;
  final double leftSkipBtn;

  /// This is the constructor of the class
  TutorialItem({
    required this.globalKey,
    required this.child,
    this.radius,
    this.color = const Color.fromRGBO(0, 0, 0, 0.9),
    this.borderRadius = const Radius.circular(10.0),
    this.shapeFocus = ShapeFocus.roundedSquare,
    this.lineSide = TutorialSideEnum.empty,
    this.lineLength = 2.0,
    this.lineWidth = 2.0,
    this.right = 100,
    this.top = 100,
    this.showSkip = false,
    this.topSkipBtn = 0.0,
    this.setSkipBtn,
    this.skipBtnWidget,
    this.leftSkipBtn = 0.0,
  });
}
