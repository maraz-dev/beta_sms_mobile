import 'dart:async';

import 'package:beta_sms_mobile/core/di/injector.dart';
import 'package:beta_sms_mobile/data/models/requests/create_account_req.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateAccountNotifier extends AutoDisposeAsyncNotifier<String> {
  Future<void> createAccountMethod(CreateAccountReq createAccountReq) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(authRepository).createAccount(createAccountReq));
  }

  @override
  FutureOr<String> build() {
    return "";
  }
}

final createAccountProvider =
    AsyncNotifierProvider.autoDispose<CreateAccountNotifier, String>(
        CreateAccountNotifier.new);
