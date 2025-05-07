import 'dart:async';

import 'package:beta_sms_mobile/core/di/injector.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SendOTPNotifier extends AutoDisposeAsyncNotifier<String> {
  Future<void> sendOTPmethod(String email) async {
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => ref.read(authRepository).sendOTP(email));
  }

  @override
  FutureOr<String> build() {
    return "";
  }
}

class ValidateOTPNotifier extends AutoDisposeAsyncNotifier<String> {
  Future<void> validateOTPmethod(String email, String otp) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(authRepository).validateOTP(email, otp));
  }

  @override
  FutureOr<String> build() {
    return "";
  }
}

final sendOtpProvider =
    AsyncNotifierProvider.autoDispose<SendOTPNotifier, String>(
        SendOTPNotifier.new);

final validateOtpProvider =
    AsyncNotifierProvider.autoDispose<ValidateOTPNotifier, String>(
        ValidateOTPNotifier.new);
