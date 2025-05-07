import 'package:beta_sms_mobile/data/models/requests/create_account_req.dart';
import 'package:beta_sms_mobile/presentation/features/auth/login_screen.dart';
import 'package:beta_sms_mobile/presentation/features/auth/otp_screen.dart';
import 'package:beta_sms_mobile/presentation/features/auth/vm/ceate_account_vm.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_date_picker.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/snackbar.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

ValueNotifier<String> userEmail = ValueNotifier("");

class CreateAccountScreen extends ConsumerStatefulWidget {
  const CreateAccountScreen({super.key});
  static String path = '/createAccountScreen';

  @override
  ConsumerState<CreateAccountScreen> createState() =>
      _CreateAccountScreenState();
}

class _CreateAccountScreenState extends ConsumerState<CreateAccountScreen> {
  /// Controllers
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  DateTime _dob = DateTime.now();
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
    final createAccountLoading = ref.watch(createAccountProvider);

    ref.listen(createAccountProvider, (_, next) {
      if (next is AsyncData<String>) {
        userEmail.value = _emailAddressController.text;
        context.pushNamed(OTPVerificationScreen.path);
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
                    validator: validatePhoneNumber,
                    fieldName: 'Phone Number',
                    hint: '2348012345678',
                    maxLength: 13,
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
                    readOnly: true,
                    controller: _dobController,
                    validator: validateGeneric,
                    fieldName: 'Date of Birth',
                    hint: 'Please Enter',
                    inputType: TextInputType.text,
                    onPressed: () async {
                      final value = await showPlatformDatePicker(
                        context: context,
                        initialDate: _dob,
                        firstDate: DateTime(1900),
                        lastDate: _dob,
                      );
                      if (value == null) return;
                      var formatter = DateFormat('yyyy-MM-dd');
                      String formattedDate = formatter.format(value);
                      setState(() {
                        _dob = value;
                        _dobController.text = formattedDate;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextInput(
                    controller: _referralCodeController,
                    validator: null,
                    fieldName: 'Referral Code (Optional)',
                    hint: 'Please Enter',
                    inputType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  MainButton(
                    isLoading: createAccountLoading.isLoading,
                    text: 'Create Account',
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      if (_formKey.currentState!.validate()) {
                        ref
                            .read(createAccountProvider.notifier)
                            .createAccountMethod(CreateAccountReq(
                                fullName: _fullNameController.text,
                                confirmName: _fullNameController.text,
                                emailAddress:
                                    _emailAddressController.text.trim(),
                                phoneNumber:
                                    _phoneNumberController.text.startsWith('0')
                                        ? _phoneNumberController.text
                                            .replaceFirst('0', '234')
                                        : _phoneNumberController.text,
                                roleName: 'BusinessUser',
                                dateOfBirth: _dob,
                                password: _passwordController.text,
                                referalCode:
                                    _referralCodeController.text.isEmpty
                                        ? ""
                                        : _referralCodeController.text));
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
