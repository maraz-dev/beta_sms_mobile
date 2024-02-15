import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FilterIcon extends StatelessWidget {
  const FilterIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.kBackgroundColor.withOpacity(0.3),
            border: Border.all(color: AppColors.kWhite.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(5.r)),
        child: SvgPicture.asset(AppImages.filterIcon));
  }
}
