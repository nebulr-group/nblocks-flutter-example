// Simple test of a Widget
import 'package:flutter/material.dart';

class CaseWidget extends StatelessWidget {
  final Widget trueChild;
  final Widget falseChild;
  final bool expression;

  const CaseWidget(
      {Key? key,
      required this.trueChild,
      required this.falseChild,
      required this.expression})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return expression ? trueChild : falseChild;
  }
}
