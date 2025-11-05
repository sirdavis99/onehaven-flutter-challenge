import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onehaven_flutter_challenge/utils/color_const.dart';

class AppTheme {
  static ThemeData light() {
    final base = ThemeData.light();
    final colorScheme = ColorScheme.light(
      primary: primaryColor,
      secondary: blueColor1,
      surface: whiteColor,
      background: whiteColor1,
      onPrimary: whiteColor,
      onSecondary: boldTextColor,
      onSurface: boldTextColor,
      onBackground: boldTextColor,
    );

    final textTheme = GoogleFonts.rubikTextTheme(base.textTheme).copyWith(
      bodyLarge: GoogleFonts.rubik(color: lightTextColor),
      bodyMedium: GoogleFonts.rubik(color: lightTextColor),
      bodySmall: GoogleFonts.rubik(color: lightTextColor),
      titleLarge: GoogleFonts.rubik(color: boldTextColor),
      titleMedium: GoogleFonts.rubik(color: boldTextColor),
      titleSmall: GoogleFonts.rubik(color: boldTextColor),
      labelLarge: GoogleFonts.rubik(color: boldTextColor),
      labelMedium: GoogleFonts.rubik(color: boldTextColor),
      labelSmall: GoogleFonts.rubik(color: boldTextColor),
    );

    return base.copyWith(
      colorScheme: colorScheme,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: whiteColor,
      appBarTheme: AppBarTheme(
        backgroundColor: whiteColor,
        foregroundColor: boldTextColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: boldTextColor),
        titleTextStyle: GoogleFonts.rubik(
          color: boldTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      textTheme: textTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: whiteColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightBorderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: primaryColor),
        ),
        labelStyle: TextStyle(color: lightTextColor),
        hintStyle: TextStyle(color: greyColor1),
      ),
      dividerColor: dividerColor,
    );
  }
}
