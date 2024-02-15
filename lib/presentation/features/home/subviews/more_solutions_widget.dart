import 'package:beta_sms_mobile/presentation/features/home/subviews/rounded_icon.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MoreSolutionsWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final Function()? onPressed;
  final bool isDeveloper;
  const MoreSolutionsWidget(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.buttonText,
      this.onPressed,
      this.isDeveloper = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 20, bottom: 15),
      decoration: BoxDecoration(
          color: AppColors.kWhite,
          border: Border.all(color: AppColors.kBorderColor),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const RoundedIcon(
                image: AppImages.sendMessageIcon,
              ),
              Visibility(
                  visible: isDeveloper,
                  child: SvgPicture.asset(AppImages.forDevelopersIcon))
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              subtitle,
            ),
          ),
          SizedBox(height: 15.h),
          Padding(
            padding:
                EdgeInsets.only(right: MediaQuery.sizeOf(context).width * 0.3),
            child: MainButton(
              onPressed: onPressed,
              text: buttonText,
            ),
          )
        ],
      ),
    );
  }
}
