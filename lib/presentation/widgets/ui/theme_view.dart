import 'package:flutter/material.dart';

class ViewContainer extends StatelessWidget {
  final List<Widget> children;
  final Color? backgroundColor;
  final double paddingHorizontal;
  final double paddingVertical;
  final double? height;
  final double? width;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;

  const ViewContainer({
    Key? key,
    this.children = const <Widget>[],
    this.backgroundColor = Colors.white,
    this.paddingHorizontal = 20.0,
    this.paddingVertical = 0.0,
    this.height,
    this.width,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.mainAxisAlignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        children: [...children],
      ),
    );
  }
}
