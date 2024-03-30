import 'package:beta_sms_mobile/data/models/responses/user_profile.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsTab extends ConsumerStatefulWidget {
  final UserResponse user;
  const SettingsTab({
    required this.user,
    super.key,
  });

  @override
  ConsumerState<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends ConsumerState<SettingsTab> {
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _emailAddress = TextEditingController();
  final TextEditingController _phoneNo = TextEditingController();

  @override
  void dispose() {
    _fullName.dispose();
    _emailAddress.dispose();
    _phoneNo.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fullName.text = widget.user.fullName ?? "";
    _emailAddress.text = widget.user.email ?? "";
    _phoneNo.text = widget.user.phoneNumber ?? "";
  }

  @override
  Widget build(BuildContext context) {
//    final accountDetailss = ref.watch(getAccountDetailsProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Change Account Details',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10.h),
            Text(
              'Automate notifications and provide support through our omni-channel SMS API',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20.h),
            CardInput(
              readOnly: true,
              fieldName: 'Full Name',
              controller: _fullName,
              hint: '',
              inputType: TextInputType.name,
              validator: validateGeneric,
            ),
            SizedBox(height: 15.h),
            CardInput(
              readOnly: true,
              fieldName: 'Email Address',
              controller: _emailAddress,
              hint: '',
              inputType: TextInputType.emailAddress,
              validator: validateEmail,
            ),
            SizedBox(height: 15.h),
            CardInput(
              readOnly: true,
              fieldName: 'Phone Number',
              controller: _phoneNo,
              hint: '',
              inputType: TextInputType.phone,
              validator: validateGeneric,
            ),
            SizedBox(height: 30.h),
            MainButton(
                text: 'Save Changes',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                })
          ],
        ),
      ),
    );
  }
}
