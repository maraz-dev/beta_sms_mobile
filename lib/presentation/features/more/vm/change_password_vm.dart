import 'dart:async';

import 'package:beta_sms_mobile/core/di/injector.dart';
import 'package:beta_sms_mobile/data/models/requests/change_password_req.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangePasswordNotifier extends AutoDisposeAsyncNotifier<String> {
  Future<void> changePasswordMethod(ChangePasswordReq changePasswordReq) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(moreRepository).changePassword(changePasswordReq));
  }

  @override
  FutureOr<String> build() {
    return "";
  }
}

final changePasswordProvider =
    AsyncNotifierProvider.autoDispose<ChangePasswordNotifier, String>(
        ChangePasswordNotifier.new);
