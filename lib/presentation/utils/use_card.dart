import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UseCardSheet extends StatefulWidget {
  const UseCardSheet({
    super.key,
  });

  @override
  State<UseCardSheet> createState() => _UseCardSheetState();
}

class _UseCardSheetState extends State<UseCardSheet> {
  final TextEditingController _amount = TextEditingController();
  final TextEditingController _cardNumber = TextEditingController();
  final TextEditingController _cvv = TextEditingController();
  final TextEditingController _expiryDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
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
          'Enter your card details',
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
                inputType: TextInputType.number,
                validator: validateGeneric,
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: CardInput(
                fieldName: 'CVV',
                isCVV: true,
                controller: _cvv,
                hint: 'Please Enter',
                inputType: TextInputType.number,
                validator: validateGeneric,
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        MainButton(
          isPrimary: false,
          text: 'Proceed',
          onPressed: () {},
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
    );
  }
}
