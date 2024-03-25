import 'package:beta_sms_mobile/core/http/http_service.dart';
import 'package:beta_sms_mobile/core/storage/share_pref.dart';
import 'package:beta_sms_mobile/core/utils/app_url.dart';
import 'package:beta_sms_mobile/data/models/responses/balance.dart';

class HomeService {
  final HttpService _networkService;

  HomeService({required HttpService networkService})
      : _networkService = networkService;

  final endpointUrl = ApiEndpoints.instance;

  Future<Balance> getBalance() async {
    try {
      final response = await _networkService.request(
          endpointUrl.getBalanceUnit, RequestMethod.post,
          data: {"userId": SharedPrefManager.userId});

      final res = response.data["data"];
      return Balance.fromJson(res);
    } catch (e) {
      throw e.toString();
    }
  }
}
