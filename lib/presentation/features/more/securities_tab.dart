import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecurityTab extends StatefulWidget {
  const SecurityTab({
    super.key,
  });

  @override
  State<SecurityTab> createState() => _SecurityTabState();
}

class _SecurityTabState extends State<SecurityTab> {
  final TextEditingController currentPassword = TextEditingController();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmNewPassword = TextEditingController();

  @override
  void dispose() {
    currentPassword.dispose();
    newPassword.dispose();
    confirmNewPassword.dispose();
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
            'Change Security Details',
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
          PasswordCardInput(
            fieldName: 'Current Password',
            controller: currentPassword,
            hint: '',
            inputType: TextInputType.name,
            validator: validateGeneric,
          ),
          SizedBox(height: 15.h),
          PasswordCardInput(
            fieldName: 'New Password',
            controller: newPassword,
            hint: '',
            inputType: TextInputType.emailAddress,
            validator: validateEmail,
          ),
          SizedBox(height: 15.h),
          PasswordCardInput(
            fieldName: 'Confirm New Password',
            controller: confirmNewPassword,
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
