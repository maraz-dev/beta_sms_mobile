import 'package:beta_sms_mobile/core/di/injector.dart';
import 'package:beta_sms_mobile/data/models/responses/contact_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getAccountDetailsProvider = FutureProvider.autoDispose((ref) async {
  return ref.watch(moreRepository).getAccountDetails();
});

final getContactGroupsByUserProvider = FutureProvider.autoDispose((ref) async {
  return ref.watch(moreRepository).getContactGroupByUser();
});

final getContactsByGroupProvider = FutureProvider.autoDispose
    .family<List<ContactItem>, String>((ref, arg) async {
  return ref.watch(moreRepository).getContactsInGroup(arg);
});
