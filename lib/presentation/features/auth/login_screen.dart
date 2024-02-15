import 'package:beta_sms_mobile/presentation/features/auth/create_account_screen.dart';
import 'package:beta_sms_mobile/presentation/features/dashboard/dashboard.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static String path = '/loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// Controllers
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailAddressController.dispose();
    _passwordController.dispose();
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      AppImages.betaSmsLogo,
                      width: 64.w,
                      height: 64.h,
                    ),
                    GestureDetector(
                      onTap: () => context.push(CreateAccountScreen.path),
                      child: Text(
                        'Get Started',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                  controller: _emailAddressController,
                  validator: validateEmail,
                  fieldName: 'Email Address',
                  hint: 'Please Enter',
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 10.h,
                ),
                PasswordInput(
                  controller: _passwordController,
                  validator: validatePassword,
                  fieldName: 'Password',
                  hint: '********',
                  inputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 5.h,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Forgot Password?',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.kPrimaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                MainButton(
                  text: 'Sign In',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.push(Dashboard.path);
                    }
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
