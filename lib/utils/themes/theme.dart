import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mounae/utils/themes/mounae_colors.dart';

enum ThemeOption { LIGHT, DARK, SYSTEM }

class MounaeThemeData {
  static Brightness getIconBrightness(
      BuildContext context, ThemeOption optionType) {
    if (optionType == ThemeOption.SYSTEM) {
      final brightness = WidgetsBinding.instance.window.platformBrightness;
      return brightness == Brightness.light
          ? Brightness.dark
          : Brightness.light;
    }

    return optionType == ThemeOption.LIGHT ? Brightness.dark : Brightness.light;
  }

  static ThemeMode getThemeMode(ThemeOption optionType) {
    return optionType == ThemeOption.LIGHT
        ? ThemeMode.light
        : optionType == ThemeOption.DARK
            ? ThemeMode.dark
            : ThemeMode.system;
  }

  static ThemeData get lightTheme => ThemeData.light().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
        colorScheme: ColorScheme(
          primary: MounaeColors.primaryColor,
          primaryVariant: MounaeColors.primaryVariantColor,
          secondary: MounaeColors.accentColor,
          secondaryVariant: MounaeColors.accentVariantColor,
          surface: MounaeColors.surfaceColor,
          background: MounaeColors.backgroundColor,
          error: MounaeColors.errorColor,
          onPrimary: MounaeColors.primaryTextColor,
          onSecondary: MounaeColors.accentTextColor,
          onSurface: MounaeColors.writingColor,
          onBackground: MounaeColors.writingColor,
          onError: MounaeColors.errorTextColor,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: MounaeColors.backgroundColor,
        textTheme: getTextTheme(MounaeColors.writingColor),
        primaryTextTheme: getTextTheme(MounaeColors.primaryColor),
        accentTextTheme: getTextTheme(MounaeColors.accentTextColor),
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: MounaeColors.appBarColor,
          iconTheme: IconThemeData(color: MounaeColors.writingColor),
          actionsIconTheme:
              IconThemeData(color: MounaeColors.actionIconButtonColor),
          textTheme: getTextTheme(MounaeColors.writingColor),
        ),
        buttonTheme: ButtonThemeData(
            padding: EdgeInsets.all(20.0.sp),
            colorScheme: ColorScheme.light(),
            textTheme: ButtonTextTheme.primary,
            buttonColor: MounaeColors.primaryColor,
            disabledColor: MounaeColors.buttonDisableColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.sp),
            )),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: MounaeColors.inputFocusColor,
          hoverColor: MounaeColors.inputHoverColor,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: MounaeColors.borderColor),
          ),
          hintStyle: TextStyle(
            inherit: true,
            fontSize: 18.sp,
            color: MounaeColors.hintTextColor,
            letterSpacing: 0.36.sp,
            height: 0.22.sp,
          ),
          suffixStyle: TextStyle(
            inherit: true,
            fontSize: 18.sp,
            color: MounaeColors.writingColor,
            letterSpacing: 0.36.sp,
            height: 0.22.sp,
          ),
          prefixStyle: TextStyle(
            inherit: true,
            fontSize: 18.sp,
            color: MounaeColors.writingColor,
            letterSpacing: 0.36.sp,
            height: 0.22.sp,
          ),
          labelStyle: TextStyle(
            inherit: true,
            fontSize: 16.sp,
            color: MounaeColors.primaryColor,
            letterSpacing: 0.18.sp,
            height: 0.18.sp,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
        accentColor: const Color(0xFF2196F3),
        accentColorBrightness: Brightness.dark,
        accentIconTheme: IconThemeData(color: const Color(0xFFFFFFFF)),
        textTheme: getTextTheme(const Color(0xFFFFFFFF)),
        primaryTextTheme: getTextTheme(const Color(0xFFFFFFFF)),
        accentTextTheme: getTextTheme(const Color(0xFFF0F0F0)),
        appBarTheme: AppBarTheme(
          textTheme: getTextTheme(const Color(0xFFFFFFFF)),
        ),
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.all(20.0),
          textTheme: ButtonTextTheme.primary,
          buttonColor: const Color(0xFF2196F3),
          disabledColor: const Color(0xFFBBDDFB),
        ),
      );

  static TextTheme getTextTheme(Color color) {
    return TextTheme(
      headline1: GoogleFonts.montserrat(
        fontSize: 96.sp,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5.sp,
        color: color,
      ),
      headline2: GoogleFonts.montserrat(
        fontSize: 60.sp,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5.sp,
        color: color,
      ),
      headline3: GoogleFonts.montserrat(
        fontSize: 48.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      headline4: GoogleFonts.montserrat(
        fontSize: 34.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25.sp,
        color: color,
      ),
      headline5: GoogleFonts.montserrat(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
        color: color,
      ),
      headline6: GoogleFonts.montserrat(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15.sp,
        color: color,
      ),
      subtitle1: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15.sp,
        color: color,
      ),
      subtitle2: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1.sp,
        color: color,
      ),
      bodyText1: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5.sp,
        color: color,
      ),
      bodyText2: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25.sp,
        color: color,
      ),
      button: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.25.sp,
        color: color,
      ),
      caption: GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4.sp,
        color: color,
      ),
      overline: GoogleFonts.montserrat(
        fontSize: 10.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 1.5.sp,
        color: color,
      ),
    );
  }
}
