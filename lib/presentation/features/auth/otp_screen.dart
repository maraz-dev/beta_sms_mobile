import 'package:beta_sms_mobile/presentation/features/auth/create_account_screen.dart';
import 'package:beta_sms_mobile/presentation/features/auth/login_screen.dart';
import 'package:beta_sms_mobile/presentation/features/auth/vm/otp_vm.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/snackbar.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OTPVerificationScreen extends ConsumerStatefulWidget {
  const OTPVerificationScreen({super.key});

  static String path = 'otpVerificationScreen';

  @override
  ConsumerState<OTPVerificationScreen> createState() =>
      _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends ConsumerState<OTPVerificationScreen> {
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
    final sendOtpLoading = ref.watch(sendOtpProvider);
    final otpLoading = ref.watch(validateOtpProvider);

    ref.listen(validateOtpProvider, (_, next) {
      if (next is AsyncData<String>) {
        context.pushReplacementNamed(LoginScreen.path);
        SnackBarDialog.showSuccessFlushBarMessage(
            'Account Successfully Created', context);
      }
      if (next is AsyncError) {
        SnackBarDialog.showErrorFlushBarMessage(next.error.toString(), context);
      }
    });

    ref.listen(sendOtpProvider, (_, next) {
      if (next is AsyncData<String>) {
        SnackBarDialog.showSuccessFlushBarMessage(
            'OTP has been Resent', context);
      }
      if (next is AsyncError) {
        SnackBarDialog.showErrorFlushBarMessage(next.error.toString(), context);
      }
    });
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
                  maxLength: 5,
                  inputType: TextInputType.number,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ref
                            .read(sendOtpProvider.notifier)
                            .sendOTPmethod(userEmail.value);
                      },
                      child: Text(
                        'Resend OTP',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(width: 10.h),
                    Visibility(
                        visible: sendOtpLoading.isLoading,
                        child: const SpinKitCircle(
                          color: AppColors.kPrimaryColor,
                          size: 20,
                        ))
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                MainButton(
                  isLoading: otpLoading.isLoading,
                  text: 'Continue',
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      ref.read(validateOtpProvider.notifier).validateOTPmethod(
                            userEmail.value,
                            _otpController.text,
                          );
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
