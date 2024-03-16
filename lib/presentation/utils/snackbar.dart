import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Show Error SnackBar
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(
    BuildContext context, String exception) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: AppColors.kRed,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    content: Text(
      exception,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.bold, color: AppColors.kWhite),
    ),
    duration: const Duration(seconds: 3),
    elevation: 2,
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsets.all(20.h),
    margin: EdgeInsets.only(
        bottom: ScreenUtil().screenHeight - 145, left: 10.w, right: 10.w),
  ));
}

/// Show Error SnackBar
ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnackBar(
    BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: AppColors.kGreen,
    content: Text(
      message,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontWeight: FontWeight.bold, color: AppColors.kWhite),
    ),
    duration: const Duration(seconds: 3),
    elevation: 2,
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsets.all(20.h),
    margin: EdgeInsets.only(
        bottom: ScreenUtil().screenHeight - 145, left: 10.w, right: 10.w),
  ));
}
