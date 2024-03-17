import 'dart:async';

import 'package:beta_sms_mobile/core/di/injector.dart';
import 'package:beta_sms_mobile/data/models/requests/login_req.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginNotifier extends AutoDisposeAsyncNotifier<String> {
  Future<void> loginMethod(LoginReq loginReq) async {
    state = const AsyncLoading();
    state =
        await AsyncValue.guard(() => ref.read(authRepository).login(loginReq));

    if (!state.hasError) {}
  }

  @override
  FutureOr<String> build() {
    return "";
  }
}

final loginProvider =
    AsyncNotifierProvider.autoDispose<LoginNotifier, String>(LoginNotifier.new);
