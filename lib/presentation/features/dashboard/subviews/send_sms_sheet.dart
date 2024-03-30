import 'package:beta_sms_mobile/presentation/features/dashboard/subviews/send_sms_card.dart';
import 'package:beta_sms_mobile/presentation/features/sms/bulk_send_sms.dart';
import 'package:beta_sms_mobile/presentation/features/sms/quick_send_sms.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
        SendSMSCard(
          image: AppImages.clipboardIcon,
          text: 'Send Bulk SMS',
          onPressed: () {
            context.pop();
            context.pushNamed(SendBulkSMSScreen.path);
          },
        ),
        SizedBox(height: 10.h),
        SendSMSCard(
          image: AppImages.quickSendIcon,
          text: 'Quick Send',
          onPressed: () {
            context.pop();
            context.pushNamed(QuickSendSMSScreen.path);
          },
        ),
        SizedBox(height: 50.h),
      ],
    );
  }
}
