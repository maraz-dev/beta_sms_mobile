import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextInput extends StatelessWidget {
  final String fieldName;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hint;
  final bool readOnly;
  final Function()? onPressed;
  final int? maxLength;
  const TextInput({
    super.key,
    required this.fieldName,
    required this.controller,
    required this.hint,
    required this.inputType,
    required this.validator,
    this.maxLength,
    this.readOnly = false,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          fieldName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          maxLength: maxLength,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          readOnly: readOnly,
          onTap: onPressed,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.kTextColor.withOpacity(0.5))),
        )
      ],
    );
  }
}

class PasswordInput extends StatefulWidget {
  final String fieldName;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hint;
  const PasswordInput({
    super.key,
    required this.fieldName,
    required this.controller,
    required this.hint,
    required this.inputType,
    required this.validator,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.fieldName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.inputType,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          obscuringCharacter: '*',
          decoration: InputDecoration(
              suffixIcon: IconButton(
                splashRadius: 1,
                onPressed: () {
                  setState(() => obscureText = !obscureText);
                },
                icon: Icon(
                  obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.kIconColor,
                ),
                iconSize: 19,
              ),
              hintText: widget.hint,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.kTextColor.withOpacity(0.5))),
        )
      ],
    );
  }
}

class CardInput extends StatelessWidget {
  final String fieldName;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hint;
  final bool isCVV;
  const CardInput({
    super.key,
    required this.fieldName,
    required this.controller,
    required this.hint,
    required this.inputType,
    required this.validator,
    this.isCVV = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          decoration: InputDecoration(
              suffixIcon: isCVV
                  ? SvgPicture.asset(
                      AppImages.infoIcon,
                      width: 18.w,
                      height: 18.h,
                      fit: BoxFit.none,
                    )
                  : null,
              label: Text(
                fieldName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              hintText: '',
              alignLabelWithHint: true,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.kTextColor.withOpacity(0.5))),
        )
      ],
    );
  }
}

class PasswordCardInput extends StatefulWidget {
  final String fieldName;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hint;
  const PasswordCardInput({
    super.key,
    required this.fieldName,
    required this.controller,
    required this.hint,
    required this.inputType,
    required this.validator,
  });

  @override
  State<PasswordCardInput> createState() => _PasswordCardInputState();
}

class _PasswordCardInputState extends State<PasswordCardInput> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.inputType,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          obscuringCharacter: '*',
          decoration: InputDecoration(
              suffixIcon: IconButton(
                splashRadius: 1,
                onPressed: () {
                  setState(() => obscureText = !obscureText);
                },
                icon: Icon(
                  obscureText
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: AppColors.kIconColor,
                ),
                iconSize: 19,
              ),
              label: Text(
                widget.fieldName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              hintText: '',
              alignLabelWithHint: true,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.kTextColor.withOpacity(0.5))),
        )
      ],
    );
  }
}

class ListInput extends StatelessWidget {
  final String fieldName;
  final TextInputType inputType;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String hint;
  final Function()? onPressed;
  const ListInput({
    super.key,
    required this.fieldName,
    required this.controller,
    required this.hint,
    required this.inputType,
    required this.validator,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
          key: key,
          controller: controller,
          readOnly: true,
          keyboardType: inputType,
          onTap: onPressed,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          decoration: InputDecoration(
              suffixIcon: GestureDetector(
                onTap: onPressed,
                child: SvgPicture.asset(
                  AppImages.arrowDownIcon,
                  width: 18.w,
                  height: 18.h,
                  fit: BoxFit.none,
                ),
              ),
              label: Text(
                fieldName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              hintText: '',
              alignLabelWithHint: true,
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.kTextColor.withOpacity(0.5))),
        )
      ],
    );
  }
}
