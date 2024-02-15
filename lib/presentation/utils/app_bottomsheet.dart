import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AppBottomSheet {
  static Future<void> showBottomSheet(BuildContext context,
      {required Widget widget,
      bool isDismissible = true,
      bool enableDrag = true}) async {
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        barrierColor: Colors.black.withOpacity(0.2),
        enableDrag: enableDrag,
        isScrollControlled: true,
        isDismissible: isDismissible,
        useRootNavigator: true,
        builder: (BuildContext context) {
          return Container(
            color: Colors.transparent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10, right: 20),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.kCloseIconColor,
                          border: Border.all(
                              color: AppColors.kBorderColor, width: 1.5)),
                      child: SvgPicture.asset(AppImages.closeIcon),
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 30),
                    decoration: const ShapeDecoration(
                        color: AppColors.kBackgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ))),
                    child: widget),
              ],
            ),
          );
        });
  }
}
