import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionCard extends StatelessWidget {
  final String description;
  final String time;
  final double amount;
  final bool isDebit;
  const TransactionCard({
    super.key,
    required this.description,
    required this.time,
    required this.amount,
    this.isDebit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: isDebit
                  ? AppColors.kRed.withOpacity(0.3)
                  : AppColors.kGreen.withOpacity(0.3),
              borderRadius: BorderRadius.circular(3)),
          child: SvgPicture.asset(
              isDebit ? AppImages.redArrowIcon : AppImages.greenArrowIcon),
        ),
        SizedBox(width: 15.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              time,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.kCloseIconColor),
            ),
          ],
        ),
        const Spacer(),
        Text(
          'N${amount.amountInt()}',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
