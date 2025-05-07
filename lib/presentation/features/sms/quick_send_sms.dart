import 'package:beta_sms_mobile/presentation/features/sms/subviews/campaign_card_text.dart';
import 'package:beta_sms_mobile/presentation/features/sms/subviews/send_later_sheet.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_bottomsheet.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class QuickSendSMSScreen extends StatefulWidget {
  static String path = '/sendQuickSms';
  const QuickSendSMSScreen({super.key});

  @override
  State<QuickSendSMSScreen> createState() => _QuickSendSMSScreenState();
}

class _QuickSendSMSScreenState extends State<QuickSendSMSScreen>
    with SingleTickerProviderStateMixin {
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
                        'Quick Send',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.kWhite,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
          const Expanded(child: QuickSendSmsBody())
        ],
      ),
    );
  }
}

class QuickSendSmsBody extends StatefulWidget {
  const QuickSendSmsBody({
    super.key,
  });

  @override
  State<QuickSendSmsBody> createState() => _QuickSendSmsBodyState();
}

class _QuickSendSmsBodyState extends State<QuickSendSmsBody> {
  final TextEditingController _recipients = TextEditingController();
  final TextEditingController _senderName = TextEditingController();
  final TextEditingController _message = TextEditingController();

  @override
  void dispose() {
    _recipients.dispose();
    _senderName.dispose();
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: AppColors.kWhite,
                    border: Border.all(color: AppColors.kBorderColor)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Automate notifications and provide support through our omni-channel SMS API',
                    ),
                    SizedBox(height: 10.h),
                    CardInput(
                      fieldName: "Paste Recipient",
                      controller: _recipients,
                      maxLines: 5,
                      hint: '',
                      inputType: TextInputType.multiline,
                      validator: validateGeneric,
                    ),
                    SizedBox(height: 15.h),
                    CardInput(
                      fieldName: "Sender's Name",
                      controller: _senderName,
                      hint: '',
                      inputType: TextInputType.name,
                      validator: validateGeneric,
                    ),
                    SizedBox(height: 15.h),
                    CardInput(
                      fieldName: "Message",
                      controller: _message,
                      maxLines: 5,
                      hint: '',
                      inputType: TextInputType.multiline,
                      validator: validateGeneric,
                    ),
                    SizedBox(height: 15.h),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CampaignCardText(heading: 'Characters', text: '56'),
                        CampaignCardText(heading: 'Messages', text: '1 Page'),
                        CampaignCardText(
                            heading: 'Receivers', text: '532 Contacts'),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    const CampaignCardText(
                        heading: 'Estimated Costs',
                        text: 'NGN 21,583 (511 units)'),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: MainButton(
                      isPrimary: false,
                      textColor: AppColors.kPrimaryColor,
                      color: AppColors.kBorderColor,
                      text: 'Send Later',
                      onPressed: () {
                        AppBottomSheet.showBottomSheet(context,
                            widget: const SendLaterSheet());
                      },
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                      flex: 3,
                      child: MainButtonWithIcon(
                          text: 'Send Now', onPressed: () {}))
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
