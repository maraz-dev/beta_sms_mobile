import 'dart:async';

import 'package:beta_sms_mobile/core/di/injector.dart';
import 'package:beta_sms_mobile/data/models/requests/top_up_req.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopUpNotifier extends AutoDisposeAsyncNotifier<String> {
  Future<void> topUpMethod(TopUpReq req) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
        () => ref.read(transactionsRepository).topUpBalance(req));
  }

  @override
  FutureOr<String> build() {
    return "";
  }
}

final topUpProvider =
    AsyncNotifierProvider.autoDispose<TopUpNotifier, String>(TopUpNotifier.new);
