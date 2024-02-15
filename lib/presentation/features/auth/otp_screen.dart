import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  static String path = 'otpVerificationScreen';

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  /// Controllers
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 14.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppImages.betaSmsLogo,
                      width: 64.w,
                      height: 64.h,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'OTP Generation',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Enter six digit code sent to your email or phone number',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextInput(
                  controller: _otpController,
                  validator: validateGeneric,
                  fieldName: 'OTP',
                  hint: 'Please Enter',
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 40.h,
                ),
                MainButton(
                  text: 'Continue',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
