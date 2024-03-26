import 'dart:async';

import 'package:beta_sms_mobile/core/di/injector.dart';
import 'package:beta_sms_mobile/presentation/features/transactions/vm/transaction_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubmitOTPNotifier extends AutoDisposeAsyncNotifier<bool> {
  Future<void> submitTransactionOTPMethod(String otp) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(transactionsRepository).submitTransactionOTP(otp));

    if (!state.hasError) {
      ref.invalidate(balanceProvider);
    }
  }

  @override
  FutureOr<bool> build() {
    return false;
  }
}

final submitTransactinOTPProvider =
    AsyncNotifierProvider.autoDispose<SubmitOTPNotifier, bool>(
        SubmitOTPNotifier.new);
