import 'package:beta_sms_mobile/presentation/features/sms/subviews/campaign_card_text.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CampaignsTab extends StatelessWidget {
  const CampaignsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: AppColors.kWhite,
                    border: Border.all(color: AppColors.kBorderColor)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 250.w,
                      child: Text(
                        'Acumen Digital - International Clients',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        const CampaignCardText(
                          heading: 'Added',
                          text: 'Yesterday',
                        ),
                        SizedBox(width: 20.h),
                        const CampaignCardText(
                          heading: 'Recipients',
                          text: '532 Contacts',
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.h);
            },
            itemCount: 3),
      ),
    );
  }
}
