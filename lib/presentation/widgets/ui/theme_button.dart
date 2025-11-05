import 'package:ride_hailing/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:ride_hailing/presentation/widgets/ui/x_margin.dart';
import 'package:ride_hailing/utils/colors.dart';
import 'package:ride_hailing/utils/screen.dart';

enum ThemeButtonIconPosition {
  prefix,
  suffix,
}

class ThemeButton extends StatelessWidget {
  final String text;
  final Widget? icon;
  final Color? color;
  final double? width;
  final bool outlined;
  final bool isFloating;
  final bool uppercased;
  final double? fontSize;
  final double elevation;
  final Color? background;
  final Color? disbaledBackgroundColor;
  final Color? loadingBackgroundColor;
  final Color? disbaledTextColor;
  final Color? loadingTextColor;
  final Color? borderColor;
  final EdgeInsets? padding;
  final double? borderWidth;
  final double borderRadius;
  final VoidCallback? onPressed;
  final double? loadingPercentage;
  final ThemeButtonIconPosition iconPosition;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final FontWeight? fontWeight;
  final bool? isDisabled;
  final bool isLoading;
  final double loadingSize;

  const ThemeButton(
    this.text, {
    super.key,
    this.icon,
    this.width,
    this.color,
    this.padding,
    this.fontSize = 16,
    this.onPressed,
    this.background,
    this.disbaledBackgroundColor,
    this.loadingBackgroundColor,
    this.disbaledTextColor,
    this.loadingTextColor,
    this.borderWidth,
    this.borderColor,
    this.elevation = 1,
    this.outlined = false,
    this.loadingPercentage,
    this.isFloating = false,
    this.uppercased = false,
    this.borderRadius = 8,
    this.paddingVertical = 15,
    this.paddingHorizontal = 20,
    this.fontWeight = FontWeight.w400,
    this.iconPosition = ThemeButtonIconPosition.prefix,
    this.isDisabled = false,
    this.isLoading = false,
    this.loadingSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    final hasIcon = icon != null;
    late final double buttonWidth;
    late final Color backgroundColor;

    final screenWidth = Screen.width(context);
    final prefixIcon =
        hasIcon && iconPosition == ThemeButtonIconPosition.prefix;
    final suffixIcon =
        hasIcon && iconPosition == ThemeButtonIconPosition.suffix;

    if (width != null) {
      buttonWidth = width!;
    } else {
      buttonWidth = isFloating ? screenWidth - 40 : screenWidth;
    }

    getBackgroundColor() {
      var backgroundColor = ThemeColors.primaryColor;
      if (background != null) backgroundColor = background!;
      if (isDisabled!) {
        backgroundColor = disbaledBackgroundColor ?? ThemeColors.disabledButton;
      }
      if (isLoading) {
        backgroundColor = loadingBackgroundColor ?? ThemeColors.disabledButton;
      }
      if (outlined) backgroundColor = Colors.transparent;

      return backgroundColor;
    }

    getTextColor() {
      var textColor = Colors.white;
      if (color != null) textColor = color!;
      if (isDisabled!) {
        textColor = disbaledTextColor ?? ThemeColors.disabledButtonText;
      }
      if (isLoading) {
        textColor = loadingTextColor ?? ThemeColors.disabledButtonText;
      }
      // if (outlined) textColor = Colors.transparent;

      return textColor;
    }

    backgroundColor = getBackgroundColor();

    return SizedBox(
      width: buttonWidth,
      child: Opacity(
        opacity: isLoading && loadingPercentage == null ? 0.5 : 1,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ButtonStyle(
            shadowColor:
                WidgetStatePropertyAll(backgroundColor.withOpacity(0.30)),
            backgroundColor: WidgetStatePropertyAll(backgroundColor),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                side: outlined
                    ? BorderSide(
                        width: borderWidth ?? 1,
                        color: borderColor ?? Colors.white,
                      )
                    : BorderSide.none,
              ),
            ),
            padding: WidgetStatePropertyAll(
              padding ??
                  EdgeInsets.symmetric(
                    vertical: paddingVertical ?? 25,
                    horizontal: paddingHorizontal ?? 40,
                  ),
            ),
            elevation: WidgetStatePropertyAll(elevation),
          ),
          child: isLoading
              ? SizedBox(
                  width: loadingSize,
                  height: loadingSize,
                  child: CircularProgressIndicator(
                    value: loadingPercentage,
                    semanticsLabel: 'Loading...',
                    backgroundColor: Colors.white,
                    valueColor:
                        const AlwaysStoppedAnimation(ThemeColors.primaryColor),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (prefixIcon) ...[icon!, const XMargin(8)],
                    Expanded(
                      child: Text(
                        uppercased ? text.toUpperCase() : text,
                        style: TextStyle(
                          fontSize: fontSize ?? 18,
                          fontFamily: FontFamily.rubik,
                          fontWeight: fontWeight,
                          color: getTextColor(),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (suffixIcon) ...[const XMargin(8), icon!],
                  ],
                ),
        ),
      ),
    );
  }
}
