import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AppImages.image),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Receive replies from \nyour Customers',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: 190.w,
                child: Text(
                  'Localize your communications and handle customer replies within our platform.',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 12.sp),
                ),
              ),
              SizedBox(height: 30.h),
              Row(
                children: [
                  Text(
                    'LEARN MORE',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 8.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 5.w),
                  SvgPicture.asset(AppImages.arrowRightIcon)
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
