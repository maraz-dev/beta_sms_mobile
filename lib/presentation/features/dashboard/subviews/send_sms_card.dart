import 'package:beta_sms_mobile/presentation/features/home/subviews/rounded_icon.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendSMSCard extends StatelessWidget {
  final String text;
  final String image;
  final Function()? onPressed;
  const SendSMSCard({
    super.key,
    required this.text,
    required this.image,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
            color: AppColors.kWhite,
            border: Border.all(color: AppColors.kBorderColor)),
        child: Row(
          children: [
            RoundedIcon(image: image),
            SizedBox(width: 20.h),
            Text(text)
          ],
        ),
      ),
    );
  }
}
