import 'package:beta_sms_mobile/presentation/features/transactions/vm/submit_card_pin_vm.dart';
import 'package:beta_sms_mobile/presentation/features/transactions/vm/submit_otp_vm.dart';
import 'package:beta_sms_mobile/presentation/features/transactions/vm/transaction_providers.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/snackbar.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PinAndOtpWidget extends ConsumerStatefulWidget {
  const PinAndOtpWidget({
    super.key,
  });

  @override
  ConsumerState<PinAndOtpWidget> createState() => _PinAndOtpWidgetState();
}

class _PinAndOtpWidgetState extends ConsumerState<PinAndOtpWidget>
    with SingleTickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _pin = TextEditingController();
  final TextEditingController _otp = TextEditingController();
  bool? _isOTP;
  bool readOnly = false;

  bool checkVisibility(
    bool? isOTP,
  ) =>
      isOTP ?? false;

  @override
  void initState() {
    super.initState();
    _pin.addListener(() {
      setState(() {
        _isOTP = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final pinLoading = ref.watch(submitCardPinProvider);
    final otpLoading = ref.watch(submitTransactinOTPProvider);
    ref.listen(submitCardPinProvider, (_, next) {
      if (next is AsyncData<bool>) {
        _isOTP = next.value;
        setState(() {
          readOnly = true;
        });
      }
      if (next is AsyncError) {
        SnackBarDialog.showErrorFlushBarMessage(next.error.toString(), context);
      }
    });
    ref.listen(submitTransactinOTPProvider, (_, next) {
      if (next is AsyncData<bool>) {
        context.pop();
        SnackBarDialog.showSuccessFlushBarMessage("Top Up Successful", context);
      }
      if (next is AsyncError) {
        SnackBarDialog.showErrorFlushBarMessage(next.error.toString(), context);
      }
    });

    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Verify your Card Details',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20.h),
            PINInput(
              readOnly: readOnly,
              fieldName: 'Card PIN',
              maxLength: 4,
              controller: _pin,
              isLoading: pinLoading.isLoading,
              onChanged: (v) {
                if (v.isEmpty) {
                  setState(() => _isOTP = null);
                } else if (v.length == 4) {
                  FocusScope.of(context).unfocus();
                  ref
                      .read(submitCardPinProvider.notifier)
                      .submitCardPinMethod(_pin.text);
                }
              },
              onFieldSubmitted: (value) {
                if (_pin.text.isEmpty) return;
                ref
                    .read(submitCardPinProvider.notifier)
                    .submitCardPinMethod(_pin.text);
              },
              hint: 'Please Enter',
              inputType: TextInputType.number,
              validator: validateGeneric,
            ),
            SizedBox(height: 10.h),
            Visibility(
              visible: checkVisibility(_isOTP),
              child: Animate(
                effects: const [SlideEffect()],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enter the 6 Digit OTP sent to you",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    CardInput(
                      fieldName: 'OTP',
                      maxLength: 6,
                      controller: _otp,
                      onChanged: (v) {
                        if (v.isEmpty) {
                          setState(() => _isOTP = null);
                        }
                      },
                      hint: 'Please Enter',
                      inputType: TextInputType.number,
                      validator: validateGeneric,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            MainButton(
              isLoading: otpLoading.isLoading,
              isPrimary: false,
              text: 'Proceed',
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (_formKey.currentState!.validate()) {
                  ref
                      .read(submitTransactinOTPProvider.notifier)
                      .submitTransactionOTPMethod(_otp.text);
                }
              },
              color: AppColors.kLightYellow,
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.secureIcon),
                SizedBox(width: 10.h),
                const Text('Your Details are Safe and Secure')
              ],
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
