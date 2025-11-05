import 'package:ride_hailing/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class ThemeText extends StatelessWidget {
  final String? text;
  final Color? color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? textAlign;
  final bool? underline;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final int? maxLines;
  final TextOverflow? overflow;

  const ThemeText({
    super.key,
    required this.text,
    this.color = Colors.black,
    this.fontFamily = FontFamily.rubik,
    this.fontWeight = FontWeight.w400,
    this.fontSize = FontSize.base,
    this.textAlign = TextAlign.left,
    this.underline = false,
    this.decoration,
    this.decorationColor,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    final underlinedDecoration = (underline!) ? TextDecoration.underline : null;
    final textDecoration = decoration ?? underlinedDecoration;

    return Text(
      text ?? '',
      style: TextStyle(
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: textDecoration,
        decorationColor: decorationColor ?? color,
      ),
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

class SatoshiText extends StatelessWidget {
  final String? text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final bool? underline;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final int? maxLines;
  final TextOverflow? overflow;

  const SatoshiText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w400,
    this.fontSize = FontSize.base,
    this.textAlign = TextAlign.left,
    this.underline = false,
    this.decoration,
    this.decorationColor,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeText(
      text: text,
      color: color,
      fontFamily: FontFamily.satoshi,
      fontWeight: fontWeight,
      fontSize: fontSize,
      underline: underline,
      decoration: decoration,
      textAlign: textAlign,
      decorationColor: decorationColor,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

class SharpGroteskText extends StatelessWidget {
  final String? text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextAlign? textAlign;
  final bool? underline;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final int? maxLines;
  final TextOverflow? overflow;

  const SharpGroteskText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontWeight = FontWeight.w400,
    this.fontSize = FontSize.base,
    this.textAlign = TextAlign.left,
    this.underline = false,
    this.decoration,
    this.decorationColor,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ThemeText(
      text: text,
      color: color,
      fontFamily: FontFamily.sharpGrotesk,
      fontWeight: fontWeight,
      fontSize: fontSize,
      underline: underline,
      decoration: decoration,
      textAlign: textAlign,
      decorationColor: decorationColor,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
