import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({
    super.key,
  });

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  final TextEditingController fullName = TextEditingController();
  final TextEditingController emailAddress = TextEditingController();
  final TextEditingController phoneNo = TextEditingController();

  @override
  void dispose() {
    fullName.dispose();
    emailAddress.dispose();
    phoneNo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
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
            fieldName: 'Full Name',
            controller: fullName,
            hint: '',
            inputType: TextInputType.name,
            validator: validateGeneric,
          ),
          SizedBox(height: 15.h),
          CardInput(
            fieldName: 'Email Address',
            controller: emailAddress,
            hint: '',
            inputType: TextInputType.emailAddress,
            validator: validateEmail,
          ),
          SizedBox(height: 15.h),
          CardInput(
            fieldName: 'Phone Number',
            controller: phoneNo,
            hint: '',
            inputType: TextInputType.phone,
            validator: validateGeneric,
          ),
          SizedBox(height: 30.h),
          MainButton(text: 'Save Changes', onPressed: () {})
        ],
      ),
    );
  }
}
