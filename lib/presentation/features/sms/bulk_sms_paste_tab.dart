import 'package:beta_sms_mobile/presentation/features/sms/subviews/campaign_card_text.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BulkSMSPasteTab extends StatefulWidget {
  const BulkSMSPasteTab({
    super.key,
  });

  @override
  State<BulkSMSPasteTab> createState() => _BulkSMSPasteTabState();
}

class _BulkSMSPasteTabState extends State<BulkSMSPasteTab> {
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
                      inputType: TextInputType.name,
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
                      inputType: TextInputType.name,
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
                      onPressed: () {},
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
