import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchBox extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onTextEntered;
  const SearchBox({Key? key, this.hintText = "Search...", this.onTextEntered})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      onChanged: onTextEntered,
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: SvgPicture.asset(AppImages.searchIcon),
      ),
      hintText: hintText,
      padding: const MaterialStatePropertyAll(
        EdgeInsets.only(
          bottom: 2,
          left: 10,
        ),
      ),
      hintStyle: MaterialStatePropertyAll(Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: AppColors.kWhite)),
      textStyle: MaterialStatePropertyAll(Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: AppColors.kWhite)),
      constraints: const BoxConstraints(maxHeight: 70, minHeight: 44),
      side: MaterialStateProperty.all(
          BorderSide(color: AppColors.kBackgroundColor.withOpacity(0.4))),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.r))),
      backgroundColor:
          MaterialStateProperty.all(AppColors.kBorderColor.withOpacity(0.1)),
      elevation: const MaterialStatePropertyAll(0),
    );
  }
}
