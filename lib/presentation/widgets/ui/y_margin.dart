import 'package:flutter/material.dart';

class YMargin extends StatelessWidget {
  final double y;

  const YMargin(this.y, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: y);
  }
}
