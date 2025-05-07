import 'package:beta_sms_mobile/core/http/http_service.dart';
import 'package:beta_sms_mobile/core/storage/share_pref.dart';
import 'package:beta_sms_mobile/core/utils/app_url.dart';
import 'package:beta_sms_mobile/data/models/requests/change_password_req.dart';
import 'package:beta_sms_mobile/data/models/responses/contact_group_item.dart';
import 'package:beta_sms_mobile/data/models/responses/contact_item.dart';
import 'package:beta_sms_mobile/data/models/responses/get_account_details.dart';

class MoreService {
  final HttpService _networkService;

  MoreService({required HttpService networkService})
      : _networkService = networkService;

  final endpointUrl = ApiEndpoints.instance;

  Future<GetAccountDetails> getAccountDetails() async {
    try {
      final response = await _networkService.request(
          endpointUrl.getAccountDetails, RequestMethod.get);

      final res = response.data["data"];
      return GetAccountDetails.fromJson(res);
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> changePassword(ChangePasswordReq changePasswordReq) async {
    try {
      final response = await _networkService.request(
        endpointUrl.changePassword,
        RequestMethod.post,
        data: changePasswordReq.toJson(),
      );

      return response.data['message'];
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ContactGroupItem>> getContactGroupByUser() async {
    try {
      final userId = SharedPrefManager.userId;
      final response = await _networkService.request(
          "${endpointUrl.getUserContactGroup}?UserId=$userId",
          RequestMethod.get);
      final res = response.data["data"] as List;
      final responseList =
          res.map((json) => ContactGroupItem.fromJson(json)).toList();
      return responseList;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<ContactItem>> getContactsInGroup(String groupId) async {
    try {
      final response = await _networkService.request(
          "${endpointUrl.getContactByContactGroup}?ContactGroupId=$groupId",
          RequestMethod.get);
      final res = response.data["data"] as List;
      final responseList =
          res.map((json) => ContactItem.fromJson(json)).toList();
      return responseList;
    } catch (e) {
      throw e.toString();
    }
  }
}
