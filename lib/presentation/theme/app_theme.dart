import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData themeData() {
  return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.kBackgroundColor,
      fontFamily: 'Gibson',
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme());
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder focusInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: AppColors.kTextFieldColor, width: 2),
  );
  OutlineInputBorder defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: AppColors.kTextFieldColor, width: 1),
  );
  OutlineInputBorder errorInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5),
    borderSide: const BorderSide(color: AppColors.kRed, width: 1),
  );
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.all(16),
    enabledBorder: defaultInputBorder,
    focusedBorder: focusInputBorder,
    errorBorder: errorInputBorder,
    border: defaultInputBorder,
    fillColor: AppColors.kBackgroundColor,
    filled: true,
    suffixIconColor: AppColors.kTextColor,
  );
}

TextTheme textTheme() {
  return TextTheme(
    displayLarge: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
      color: AppColors.kTextColor,
    ),
    displayMedium: TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: -0.4,
      color: AppColors.kTextColor,
    ),
    displaySmall: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: AppColors.kTextColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
      letterSpacing: 0,
      color: AppColors.kTextColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
      letterSpacing: 0,
      color: AppColors.kTextColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.w300,
      letterSpacing: 0,
      color: AppColors.kTextColor,
    ),
  );
}

// AppBarTheme appBarTheme() {
//   return const AppBarTheme(
//     centerTitle: true,
//     elevation: 0,
//     color: Colors.transparent,
//     iconTheme: IconThemeData(
//       color: kWhiteColor,
//     ),
//   );