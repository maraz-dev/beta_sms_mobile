import 'package:beta_sms_mobile/data/models/requests/change_password_req.dart';
import 'package:beta_sms_mobile/data/models/responses/contact_group_item.dart';
import 'package:beta_sms_mobile/data/models/responses/contact_item.dart';
import 'package:beta_sms_mobile/data/models/responses/get_account_details.dart';
import 'package:beta_sms_mobile/data/remote/more/more_service.dart';

abstract class MoreRepository {
  Future<GetAccountDetails> getAccountDetails();
  Future<String> changePassword(ChangePasswordReq changePasswordReq);
  Future<List<ContactGroupItem>> getContactGroupByUser();
  Future<List<ContactItem>> getContactsInGroup(String groupId);
}

class MoreImpl implements MoreRepository {
  final MoreService _moreService;

  MoreImpl(this._moreService);

  @override
  Future<GetAccountDetails> getAccountDetails() async =>
      await _moreService.getAccountDetails();

  @override
  Future<String> changePassword(ChangePasswordReq changePasswordReq) async =>
      await _moreService.changePassword(changePasswordReq);

  @override
  Future<List<ContactGroupItem>> getContactGroupByUser() async =>
      await _moreService.getContactGroupByUser();

  @override
  Future<List<ContactItem>> getContactsInGroup(String groupId) async =>
      await _moreService.getContactsInGroup(groupId);
}
