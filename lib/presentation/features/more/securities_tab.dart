import 'package:beta_sms_mobile/data/models/requests/change_password_req.dart';
import 'package:beta_sms_mobile/presentation/features/more/vm/change_password_vm.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/snackbar.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SecurityTab extends ConsumerStatefulWidget {
  const SecurityTab({
    super.key,
  });

  @override
  ConsumerState<SecurityTab> createState() => _SecurityTabState();
}

class _SecurityTabState extends ConsumerState<SecurityTab> {
  final GlobalKey<FormState> _formkey = GlobalKey();
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
    final changePasswordLoading = ref.watch(changePasswordProvider);

    ref.listen(changePasswordProvider, (_, next) {
      if (next is AsyncData<String>) {
        SnackBarDialog.showSuccessFlushBarMessage(
            'Password Has Been Changed Successfully', context);
        _formkey.currentState?.reset();
        currentPassword.clear();
        newPassword.clear();
        confirmNewPassword.clear();
      }
      if (next is AsyncError) {
        SnackBarDialog.showErrorFlushBarMessage(next.error.toString(), context);
        currentPassword.clear();
        newPassword.clear();
        confirmNewPassword.clear();
      }
    });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Form(
          key: _formkey,
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
                inputType: TextInputType.visiblePassword,
                validator: validatePassword,
              ),
              SizedBox(height: 15.h),
              PasswordCardInput(
                fieldName: 'New Password',
                controller: newPassword,
                hint: '',
                inputType: TextInputType.visiblePassword,
                validator: validateFirstPassword,
              ),
              SizedBox(height: 15.h),
              PasswordCardInput(
                fieldName: 'Confirm New Password',
                controller: confirmNewPassword,
                hint: '',
                inputType: TextInputType.visiblePassword,
                validator: validatePassword,
              ),
              SizedBox(height: 30.h),
              MainButton(
                isLoading: changePasswordLoading.isLoading,
                text: 'Save Changes',
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  if (_formkey.currentState!.validate()) {
                    ref
                        .read(changePasswordProvider.notifier)
                        .changePasswordMethod(ChangePasswordReq(
                            currentPassword: currentPassword.text,
                            newPassword: newPassword.text,
                            confirmNewPassword: confirmNewPassword.text));
                  }
                },
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
