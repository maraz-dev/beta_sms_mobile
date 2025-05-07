import 'package:beta_sms_mobile/data/models/requests/top_up_req.dart';
import 'package:beta_sms_mobile/presentation/features/home/subviews/pin_and_otp_bottomsheet.dart';
import 'package:beta_sms_mobile/presentation/features/transactions/vm/topup_vm.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_bottomsheet.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/snackbar.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UseCardSheet extends ConsumerStatefulWidget {
  const UseCardSheet({
    super.key,
  });

  @override
  ConsumerState<UseCardSheet> createState() => _UseCardSheetState();
}

class _UseCardSheetState extends ConsumerState<UseCardSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _cvv = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();

  @override
  void dispose() {
    _amount.dispose();
    _cardNumber.dispose();
    _cvv.dispose();
    _expiryDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topUpLoading = ref.watch(topUpProvider);
    ref.listen(topUpProvider, (_, next) {
      if (next is AsyncData<String>) {
        context.pop();
        AppBottomSheet.showBottomSheet(context,
            widget: const PinAndOtpWidget());
      }
      if (next is AsyncError) {
        SnackBarDialog.showErrorFlushBarMessage(next.error.toString(), context);
      }
    });
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardInput(
              fieldName: 'Amount',
              controller: _amount,
              hint: 'Please Enter',
              inputType: TextInputType.number,
              validator: validateGeneric,
            ),
            SizedBox(height: 20.h),
            Text(
              'Enter your Card details',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            CardInput(
              fieldName: 'Card Number',
              controller: _cardNumber,
              hint: 'Please Enter',
              inputType: TextInputType.number,
              validator: validateGeneric,
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: CardInput(
                    fieldName: 'Expiry Date',
                    controller: _expiryDate,
                    hint: 'Please Enter',
                    isDate: true,
                    inputType: TextInputType.number,
                    validator: validateGeneric,
                    maxLength: 5,
                    onChanged: (value) {
                      if (value.length == 2 &&
                          !_expiryDate.text.endsWith('/')) {
                        _expiryDate.value = TextEditingValue(
                          text: '$value/',
                          selection: const TextSelection.collapsed(offset: 3),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: CardInput(
                    fieldName: 'CVV',
                    isCVV: true,
                    controller: _cvv,
                    maxLength: 3,
                    hint: 'Please Enter',
                    inputType: TextInputType.number,
                    validator: validateGeneric,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            MainButton(
              isLoading: topUpLoading.isLoading,
              isPrimary: false,
              text: 'Proceed',
              onPressed: () {
                FocusScope.of(context).unfocus();
                if (_formKey.currentState!.validate()) {
                  List<String> expiryDateSeparated =
                      _expiryDate.text.split('/');
                  ref.read(topUpProvider.notifier).topUpMethod(
                        TopUpReq(
                          amount: int.tryParse(_amount.text),
                          cardNumber: _cardNumber.text,
                          cardCvv: int.tryParse(_cvv.text),
                          cardExpiryMonth: int.tryParse(expiryDateSeparated[0]),
                          cardExpiryYear: int.tryParse(expiryDateSeparated[1]),
                        ),
                      );
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
            SizedBox(height: 50.h),
          ],
        ),
      ),
    );
  }
}
