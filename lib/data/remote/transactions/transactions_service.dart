import 'package:beta_sms_mobile/core/http/http_service.dart';
import 'package:beta_sms_mobile/core/storage/share_pref.dart';
import 'package:beta_sms_mobile/core/utils/app_url.dart';
import 'package:beta_sms_mobile/data/models/requests/top_up_req.dart';
import 'package:beta_sms_mobile/data/models/responses/balance.dart';
import 'package:beta_sms_mobile/data/models/responses/transaction_item.dart';

class TransactionsService {
  final HttpService _networkService;

  TransactionsService({required HttpService networkService})
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

  Future<String> topUpBalance(TopUpReq topUpReq) async {
    try {
      final response = await _networkService.request(
          endpointUrl.topUp, RequestMethod.post,
          data: topUpReq.toJson());
      final res = response.data["message"];
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> submitCardPIN(String pin) async {
    final userId = SharedPrefManager.userId;
    try {
      final response = await _networkService.request(
          endpointUrl.submitCardPin, RequestMethod.post,
          data: {"Pin": pin, "Reference": userId});
      final res = response.data["data"];
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> submitTransactionOTP(String otp) async {
    try {
      final response = await _networkService.request(
          endpointUrl.submitTransationOTP, RequestMethod.post,
          data: {"otp": otp});
      final res = response.data["data"];
      return res;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<TransactionItem>> getTransactions() async {
    final userId = SharedPrefManager.userId;
    try {
      final response = await _networkService.request(
          endpointUrl.getTransaction, RequestMethod.post,
          data: {"userId": userId});
      final res = response.data["data"] as List;
      final responseList =
          res.map((json) => TransactionItem.fromJson(json)).toList();
      return responseList;
    } catch (e) {
      throw e.toString();
    }
  }
}
