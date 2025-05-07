import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ContactCard extends StatelessWidget {
  final String contactName;
  final String phoneNo;
  final String listName;
  const ContactCard({
    super.key,
    required this.contactName,
    required this.phoneNo,
    required this.listName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contactName,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.kIconColor, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 10.h),
                Text(
                  phoneNo,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(AppImages.optionsIcon),
                ),
                SizedBox(height: 10.h),
                Text(
                  listName,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 10.sp,
                      color: AppColors.kInternationalBlueColor),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
