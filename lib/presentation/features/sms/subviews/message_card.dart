import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: AppColors.kWhite,
          border: Border.all(color: AppColors.kBorderColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Acumen Digital',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 10.h),
          Text(
            '22, JAN. 2021 - 3:34PM',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: AppColors.kLightGrey),
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              SvgPicture.asset(
                AppImages.arrowRightIcon,
                colorFilter: const ColorFilter.mode(
                    AppColors.kButtonBlueColor, BlendMode.srcIn),
                width: 8,
                height: 14,
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                  width: 220.w,
                  child: const Text(
                    'May the New Year bless you with health, wealth, and happiness. Happy new year from all of us at Acumen Digital.',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
