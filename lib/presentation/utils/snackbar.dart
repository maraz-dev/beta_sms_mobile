import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

// /// Show Error SnackBar
// ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showErrorSnackBar(
//     BuildContext context, String exception) {
//   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     backgroundColor: AppColors.kRed,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//     content: Text(
//       exception,
//       style: Theme.of(context)
//           .textTheme
//           .bodyMedium!
//           .copyWith(fontWeight: FontWeight.bold, color: AppColors.kWhite),
//     ),
//     duration: const Duration(seconds: 3),
//     elevation: 2,
//     behavior: SnackBarBehavior.floating,
//     padding: EdgeInsets.all(20.h),
//     margin: EdgeInsets.only(
//         bottom: ScreenUtil().screenHeight - 160, left: 10.w, right: 10.w),
//   ));
// }

// /// Show Error SnackBar
// ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSuccessSnackBar(
//     BuildContext context, String message) {
//   return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     backgroundColor: AppColors.kGreen,
//     content: Text(
//       message,
//       style: Theme.of(context)
//           .textTheme
//           .bodyMedium!
//           .copyWith(fontWeight: FontWeight.bold, color: AppColors.kWhite),
//     ),
//     duration: const Duration(seconds: 3),
//     elevation: 2,
//     behavior: SnackBarBehavior.floating,
//     padding: EdgeInsets.all(20.h),
//     margin: EdgeInsets.only(
//         bottom: ScreenUtil().screenHeight - 160, left: 10.w, right: 10.w),
//   ));
// }

class SnackBarDialog {
  /// Function to display error message of value [message] in a [context] and
  /// an optional function [where] to do after displaying message
  static showErrorFlushBarMessage(String message, BuildContext context,
      {bool shouldDismiss = true, Function? where}) {
    bool opened = true;
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        useRootNavigator: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        transitionDuration: const Duration(milliseconds: 100),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          if (shouldDismiss) {
            Future.delayed(const Duration(milliseconds: 2500), () {
              if (opened) {
                Navigator.of(buildContext, rootNavigator: false).pop();
              }
            }).then((value) {
              if (where != null) where();
            });
          }
          return Material(
            type: MaterialType.transparency,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                color: AppColors.kRed,
                child: SafeArea(
                  right: false,
                  bottom: false,
                  left: false,
                  child: Text(
                    message,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.kWhite),
                  ),
                ),
              ),
            ),
          );
        }).then((value) => opened = false);
  }

  /// Function to display error message of value [message] in a [context] and
  /// an optional function [where] to do after displaying message
  static showSuccessFlushBarMessage(String message, BuildContext context,
      {bool shouldDismiss = true, Function? where}) {
    bool opened = true;
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        useRootNavigator: false,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        transitionDuration: const Duration(milliseconds: 100),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          if (shouldDismiss) {
            Future.delayed(const Duration(milliseconds: 2500), () {
              if (opened) {
                Navigator.of(buildContext, rootNavigator: false).pop();
              }
            }).then((value) {
              if (where != null) where();
            });
          }
          return Material(
            type: MaterialType.transparency,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                color: AppColors.kGreen,
                child: SafeArea(
                  right: false,
                  bottom: false,
                  left: false,
                  child: Text(
                    message,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.kWhite),
                  ),
                ),
              ),
            ),
          );
        }).then((value) => opened = false);
  }
}
