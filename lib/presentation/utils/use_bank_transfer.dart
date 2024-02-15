import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UseBankTransferSheet extends StatefulWidget {
  const UseBankTransferSheet({
    super.key,
  });

  @override
  State<UseBankTransferSheet> createState() => _UseBankTransferSheetState();
}

class _UseBankTransferSheetState extends State<UseBankTransferSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'To fund your ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: 'BetaSMS',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.kYellow,
                      fontWeight: FontWeight.w400), // Set the color to yellow
                ),
                TextSpan(
                  text: ' account, use \nany account number below:',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'Account Name:',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 5.h),
        Text(
          'TEXT BETTER VENTURES',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(5)),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const AcctDetailsCard();
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 0,
                    color: AppColors.kBorderColor,
                    thickness: 1,
                  );
                },
                itemCount: 5),
          ),
        )
      ],
    );
  }
}

class AcctDetailsCard extends StatelessWidget {
  const AcctDetailsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: Row(
        children: [
          Image.asset(AppImages.gtbIcon),
          SizedBox(width: 10.h),
          const Text('0014240299'),
          const Spacer(),
          SvgPicture.asset(AppImages.copyIcon)
        ],
      ),
    );
  }
}
