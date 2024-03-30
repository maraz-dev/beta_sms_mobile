import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

class MainButton extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final Function()? onPressed;
  const MainButton({
    super.key,
    required this.text,
    this.isPrimary = true,
    this.color = AppColors.kPrimaryColor,
    this.textColor = AppColors.kWhite,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
            color: isPrimary ? AppColors.kPrimaryColor : color,
            borderRadius: BorderRadius.circular(5.r)),
        child: isLoading
            ? const SpinKitThreeBounce(
                color: AppColors.kWhite,
                size: 18,
              )
            : Center(
                child: Text(
                  text,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isPrimary ? AppColors.kWhite : textColor),
                ),
              ),
      ),
    );
  }
}

class MainButtonWithIcon extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final Function()? onPressed;
  const MainButtonWithIcon({
    super.key,
    required this.text,
    this.isPrimary = true,
    this.color = AppColors.kPrimaryColor,
    this.textColor = AppColors.kWhite,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
            color: isPrimary ? AppColors.kPrimaryColor : color,
            borderRadius: BorderRadius.circular(5.r)),
        child: isLoading
            ? const SpinKitThreeBounce(
                color: AppColors.kWhite,
                size: 18,
              )
            : Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      text,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isPrimary ? AppColors.kWhite : textColor),
                    ),
                    SvgPicture.asset(
                      AppImages.sendMessageIcon,
                      colorFilter: const ColorFilter.mode(
                        AppColors.kWhite,
                        BlendMode.srcIn,
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
