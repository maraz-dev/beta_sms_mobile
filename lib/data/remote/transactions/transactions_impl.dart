import 'package:beta_sms_mobile/data/models/requests/top_up_req.dart';
import 'package:beta_sms_mobile/data/models/responses/balance.dart';
import 'package:beta_sms_mobile/data/models/responses/transaction_item.dart';
import 'package:beta_sms_mobile/data/remote/transactions/transactions_service.dart';

abstract class TransactionsRepository {
  Future<Balance> getBalance();
  Future<String> topUpBalance(TopUpReq topUpReq);
  Future<bool> submitCardPIN(String pin);
  Future<bool> submitTransactionOTP(String otp);
  Future<List<TransactionItem>> getTransactions();
}

class TransactionsImpl implements TransactionsRepository {
  final TransactionsService _transactionsService;

  TransactionsImpl(this._transactionsService);
  @override
  Future<Balance> getBalance() async => await _transactionsService.getBalance();

  @override
  Future<List<TransactionItem>> getTransactions() async =>
      await _transactionsService.getTransactions();

  @override
  Future<bool> submitCardPIN(String pin) async =>
      await _transactionsService.submitCardPIN(pin);

  @override
  Future<bool> submitTransactionOTP(String otp) async =>
      await _transactionsService.submitTransactionOTP(otp);

  @override
  Future<String> topUpBalance(TopUpReq topUpReq) async =>
      await _transactionsService.topUpBalance(topUpReq);
}
