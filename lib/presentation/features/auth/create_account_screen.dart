import 'package:beta_sms_mobile/presentation/features/auth/login_screen.dart';
import 'package:beta_sms_mobile/presentation/features/auth/otp_screen.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});
  static String path = '/createAccountScreen';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  /// Controllers
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _referralCodeController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailAddressController.dispose();
    _phoneNumberController.dispose();
    _passwordController.dispose();
    _dobController.dispose();
    _referralCodeController.dispose();
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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AppImages.betaSmsLogo,
                        width: 64.w,
                        height: 64.h,
                      ),
                      GestureDetector(
                        onTap: () => context.push(LoginScreen.path),
                        child: Text(
                          'Sign In',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.kPrimaryColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    'Welcome!',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'Automate notifications and provide support through our omnichannel SMS API',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  TextInput(
                    controller: _fullNameController,
                    validator: validateGeneric,
                    fieldName: 'Full Name',
                    hint: 'Please Enter',
                    inputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextInput(
                    controller: _emailAddressController,
                    validator: validateEmail,
                    fieldName: 'Username (Email Address)',
                    hint: 'Please Enter',
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextInput(
                    controller: _phoneNumberController,
                    validator: validateGeneric,
                    fieldName: 'Phone Number',
                    hint: '2348012345678',
                    inputType: TextInputType.phone,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  PasswordInput(
                    controller: _passwordController,
                    validator: validateFirstPassword,
                    fieldName: 'Password',
                    hint: '********',
                    inputType: TextInputType.visiblePassword,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextInput(
                    controller: _dobController,
                    validator: validateGeneric,
                    fieldName: 'Date of Birth',
                    hint: 'Please Enter',
                    inputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextInput(
                    controller: _referralCodeController,
                    validator: validateGeneric,
                    fieldName: 'Referral Code (Optional)',
                    hint: 'Please Enter',
                    inputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  MainButton(
                    text: 'Get Started',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.push(OTPVerificationScreen.path);
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
