import 'package:beta_sms_mobile/core/di/injector.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final balanceProvider = FutureProvider.autoDispose((ref) async {
  return await ref.watch(homeRepository).getBalance();
});
