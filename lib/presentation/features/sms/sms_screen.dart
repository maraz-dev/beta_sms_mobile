import 'package:beta_sms_mobile/presentation/features/sms/campaigns_tab.dart';
import 'package:beta_sms_mobile/presentation/features/sms/draft_tab.dart';
import 'package:beta_sms_mobile/presentation/features/sms/messages_tab.dart';
import 'package:beta_sms_mobile/presentation/features/sms/subviews/sms_button.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/filter_icon.dart';
import 'package:beta_sms_mobile/presentation/utils/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SMSScreen extends StatefulWidget {
  static String path = '/smsScreen';
  const SMSScreen({super.key});

  @override
  State<SMSScreen> createState() => _SMSScreenState();
}

class _SMSScreenState extends State<SMSScreen>
    with SingleTickerProviderStateMixin {
  late TabController _smsTabController;

  @override
  void initState() {
    super.initState();
    _smsTabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: AppColors.kDarkBlue,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'SMS',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.kWhite,
                            fontWeight: FontWeight.w500),
                      ),
                      const SmsButton(),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      const Expanded(child: SearchBox()),
                      SizedBox(width: 10.h),
                      const FilterIcon()
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 40.h,
                    child: TabBar(
                      controller: _smsTabController,
                      labelColor: AppColors.kYellow,
                      unselectedLabelColor: AppColors.kUnselectedTabText,
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                      unselectedLabelStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                      indicatorColor: AppColors.kYellow,
                      indicatorSize: TabBarIndicatorSize.label,
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.h, vertical: 0.h),
                      tabs: const [
                        Tab(text: 'Sent'),
                        Tab(text: 'Draft'),
                        Tab(text: 'Campaigns'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _smsTabController,
              children: const [
                MessagesTab(),
                DraftsTab(),
                CampaignsTab(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
