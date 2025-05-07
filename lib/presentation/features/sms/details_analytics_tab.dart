import 'package:beta_sms_mobile/presentation/features/sms/sms_details_screen.dart';
import 'package:beta_sms_mobile/presentation/features/sms/subviews/campaign_card_text.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsAnalyticsTab extends StatelessWidget {
  const DetailsAnalyticsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CampaignCardText(heading: 'Characters', text: '56'),
                CampaignCardText(heading: 'Message', text: '1 Page'),
                SizedBox()
              ],
            ),
            const Line(
              color: AppColors.kBorderColor,
              thick: 1,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CampaignCardText(heading: 'Receivers', text: '532 Contacts'),
                CampaignCardText(heading: 'DND Numbers', text: '22 Contacts'),
                SizedBox()
              ],
            ),
            const Line(
              color: AppColors.kBorderColor,
              thick: 1,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CampaignCardText(
                  heading: 'DELIVERED',
                  text: '532 Contacts',
                  isNotCampaign: true,
                  color: AppColors.kGreen,
                ),
                CampaignCardText(
                  heading: 'FAILED',
                  text: '22 Contacts',
                  isNotCampaign: true,
                  color: AppColors.kRed,
                ),
                SizedBox()
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              decoration: BoxDecoration(
                  color: AppColors.kWhite,
                  border: Border.all(color: AppColors.kBorderColor)),
              child: Column(
                children: [
                  Container(
                    width: 125.w,
                    height: 125.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r)),
                    child: CustomPaint(
                      painter: GradientBorderPainter(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              AppColors.kGreen,
                              AppColors.kGreen,
                              AppColors.kWhite,
                              AppColors.kWhite.withOpacity(0)
                            ],
                          ),
                          strokeWidth: 5),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '98%',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(
                                      color: AppColors.kGreen,
                                      fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'DELIVERY RATE',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'NETWORK BREAK DOWN',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 20.h),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        NetworkCard(
                          color: AppColors.kYellow,
                          network: 'MTN',
                          contacts: 242,
                        ),
                        Spacer(),
                        NetworkCard(
                          color: AppColors.kRed,
                          network: 'AIRTEL',
                          contacts: 112,
                        )
                      ],
                    ),
                  ),
                  const Line(
                    color: AppColors.kBorderColor,
                    thick: 1,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        NetworkCard(
                          color: AppColors.kGreen,
                          network: 'GLO',
                          contacts: 64,
                        ),
                        Spacer(),
                        NetworkCard(
                          color: AppColors.kLightGreen,
                          network: '9Mobile',
                          contacts: 64,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h)
          ],
        ),
      ),
    );
  }
}

class NetworkCard extends StatelessWidget {
  final Color color;
  final String network;
  final int contacts;
  const NetworkCard({
    super.key,
    required this.color,
    required this.network,
    required this.contacts,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          color: color,
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              network,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 10.h),
            Text(
              '$contacts Contacts',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        )
      ],
    );
  }
}
