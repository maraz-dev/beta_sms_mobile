import 'dart:developer';

import 'package:beta_sms_mobile/core/http/http_service.dart';
import 'package:beta_sms_mobile/core/storage/secure-storage/secure_storage.dart';
import 'package:beta_sms_mobile/core/utils/app_url.dart';
import 'package:beta_sms_mobile/data/models/responses/get_account_details.dart';

class MoreService {
  final HttpService _networkService;
  final SecureStorageBase _storage;

  MoreService(
      {required HttpService networkService, required SecureStorageBase storage})
      : _networkService = networkService,
        _storage = storage;

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
}
