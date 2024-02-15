import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmsButton extends StatelessWidget {
  const SmsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          color: AppColors.kPrimaryColor,
          borderRadius: BorderRadius.circular(5.r),
          border:
              Border.all(color: AppColors.kWhite.withOpacity(0.3), width: 2)),
      child: Text(
        'Send SMS',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: AppColors.kWhite, fontWeight: FontWeight.w500),
      ),
    );
  }
}
