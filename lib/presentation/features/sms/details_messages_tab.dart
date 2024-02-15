import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/extensions.dart';
import 'package:beta_sms_mobile/presentation/utils/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DetailsMessageTab extends StatelessWidget {
  const DetailsMessageTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.kLightGrey.withOpacity(0.5)),
                child: Text(
                  'Acumen Digital'.getAbbreviation(),
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(width: 10.h),
              Column(
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
                      const EditButton(),
                      SizedBox(width: 20.h),
                      const DeleteButton()
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(height: 30.h),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              border: Border.all(color: AppColors.kBorderColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'TO: Acumen Digital - International Clients',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Line(
                  color: AppColors.kBorderColor,
                  thick: 1,
                ),
                Text(
                  'May the New Year bless you with health, wealth, and happiness. Happy new year from all of us at Acumen Digital.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImages.deleteIcon),
        SizedBox(width: 10.h),
        Text(
          'Archive',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.kRed),
        )
      ],
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImages.editIcon),
        SizedBox(width: 10.h),
        Text(
          'Edit & Send',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.kButtonBlueColor2),
        )
      ],
    );
  }
}
