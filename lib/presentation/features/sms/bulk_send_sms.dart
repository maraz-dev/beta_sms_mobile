import 'package:beta_sms_mobile/presentation/features/sms/bulk_sms_choose_tab.dart';
import 'package:beta_sms_mobile/presentation/features/sms/bulk_sms_paste_tab.dart';
import 'package:beta_sms_mobile/presentation/features/sms/bulk_sms_upload_tab.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SendBulkSMSScreen extends StatefulWidget {
  static String path = '/sendBulkSms';
  const SendBulkSMSScreen({super.key});

  @override
  State<SendBulkSMSScreen> createState() => _SendBulkSMSScreenState();
}

class _SendBulkSMSScreenState extends State<SendBulkSMSScreen>
    with SingleTickerProviderStateMixin {
  late TabController _sendBulkSMSTabController;

  @override
  void initState() {
    super.initState();
    _sendBulkSMSTabController = TabController(length: 3, vsync: this);
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
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      GestureDetector(
                          onTap: () => context.pop(),
                          child: SvgPicture.asset(AppImages.closeIcon)),
                      SizedBox(width: 20.w),
                      Text(
                        'Send Bulk SMS',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.kWhite,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    height: 40.h,
                    child: TabBar(
                      controller: _sendBulkSMSTabController,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      dividerHeight: 0,
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
                        Tab(text: 'Paste'),
                        Tab(text: 'Upload'),
                        Tab(text: 'Choose from Contact'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _sendBulkSMSTabController,
              children: const [
                BulkSMSPasteTab(),
                BulkSMSUploadTab(),
                BulkSMSChooseTab(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
