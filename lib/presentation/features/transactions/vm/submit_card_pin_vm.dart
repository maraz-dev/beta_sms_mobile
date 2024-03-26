import 'dart:async';

import 'package:beta_sms_mobile/core/di/injector.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubmitCardPinNotifier extends AutoDisposeAsyncNotifier<bool> {
  Future<void> submitCardPinMethod(String pin) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(transactionsRepository).submitCardPIN(pin));
  }

  @override
  FutureOr<bool> build() {
    return false;
  }
}

final submitCardPinProvider =
    AsyncNotifierProvider.autoDispose<SubmitCardPinNotifier, bool>(
        SubmitCardPinNotifier.new);
