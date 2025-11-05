import 'package:flutter/material.dart';

class XMargin extends StatelessWidget {
  final double x;

  const XMargin(this.x, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: x);
  }
}
