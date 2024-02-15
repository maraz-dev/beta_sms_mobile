import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainButton extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final Color color;
  final Color textColor;
  final Function()? onPressed;
  const MainButton({
    super.key,
    required this.text,
    this.isPrimary = true,
    this.color = AppColors.kPrimaryColor,
    this.textColor = AppColors.kWhite,
    required this.onPressed,
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
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: isPrimary ? AppColors.kWhite : textColor),
          ),
        ),
      ),
    );
  }
}
