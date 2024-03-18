import 'package:beta_sms_mobile/core/di/injector.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getAccountDetailsProvider = FutureProvider.autoDispose((ref) async {
  return ref.watch(moreRepository).getAccountDetails();
});
