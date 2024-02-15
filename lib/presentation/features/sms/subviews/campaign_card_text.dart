import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignCardText extends StatelessWidget {
  final String heading;
  final String text;
  final bool isNotCampaign;
  final Color color;
  const CampaignCardText({
    super.key,
    required this.heading,
    required this.text,
    this.isNotCampaign = false,
    this.color = AppColors.kLightGrey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: isNotCampaign ? color : AppColors.kLightGrey),
        ),
        SizedBox(height: 10.h),
        Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: isNotCampaign ? color : AppColors.kTextColor,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
