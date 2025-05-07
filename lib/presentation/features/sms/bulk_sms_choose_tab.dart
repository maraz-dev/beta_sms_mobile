import 'package:beta_sms_mobile/data/models/responses/contact_group_item.dart';
import 'package:beta_sms_mobile/presentation/features/more/vm/more_providers.dart';
import 'package:beta_sms_mobile/presentation/features/sms/subviews/campaign_card_text.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_dropdown.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BulkSMSChooseTab extends ConsumerStatefulWidget {
  const BulkSMSChooseTab({
    super.key,
  });

  @override
  ConsumerState<BulkSMSChooseTab> createState() => _BulkSMSChooseTabState();
}

class _BulkSMSChooseTabState extends ConsumerState<BulkSMSChooseTab> {
  final TextEditingController _recipients = TextEditingController();
  final TextEditingController _senderName = TextEditingController();
  final TextEditingController _message = TextEditingController();

  ContactGroupItem _selectedGroup = ContactGroupItem();
  final GlobalKey<State> _key = GlobalKey();

  @override
  void dispose() {
    _recipients.dispose();
    _senderName.dispose();
    _message.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactList = ref.watch(getContactGroupsByUserProvider);

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
                    contactList.maybeWhen(
                      data: (data) {
                        if (data.isEmpty) {
                          return const Center(
                            child: Text("You do not have any Contact List"),
                          );
                        } else {
                          List<String> items =
                              data.map((e) => e.name ?? "").toList();

                          return ListInput(
                            textKey: _key,
                            fieldName: 'Select List Name',
                            controller: _recipients,
                            hint: '',
                            inputType: TextInputType.name,
                            validator: null,
                            onPressed: () async {
                              await platformSpecificDropdown(
                                key: _key,
                                context: context,
                                items: items,
                                value: _selectedGroup.name ?? "",
                                onChanged: (newValue) {
                                  setState(() {
                                    _recipients.text = newValue ?? "";
                                    _selectedGroup = data
                                        .where((element) =>
                                            element.name == newValue)
                                        .first;
                                    //ref.invalidate(getAccountDetailsProvider);
                                    //print(_selectedGroup.id);
                                    //ref.watch(getContactsByGroupProvider());
                                  });
                                },
                              );
                            },
                          );
                        }
                      },
                      error: (error, stackTrace) => Center(
                        child: Text(
                          error.toString(),
                        ),
                      ),
                      orElse: () => const Center(
                        child: SpinKitRipple(
                          color: AppColors.kDarkBlue,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      '500 Contacts',
                      style: Theme.of(context).textTheme.bodySmall,
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
