import 'package:beta_sms_mobile/presentation/features/dashboard/subviews/send_sms_card.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SendSMSSheet extends StatelessWidget {
  const SendSMSSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Send SMS',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 10.h),
        const Text('Select your preferred service'),
        SizedBox(height: 30.h),
        const SendSMSCard(
          image: AppImages.clipboardIcon,
          text: 'Send Bulk SMS',
        ),
        SizedBox(height: 10.h),
        const SendSMSCard(
          image: AppImages.quickSendIcon,
          text: 'Quick Send',
        ),
        SizedBox(height: 50.h),
      ],
    );
  }
}
