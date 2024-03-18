import 'package:beta_sms_mobile/data/models/responses/get_account_details.dart';
import 'package:beta_sms_mobile/data/remote/more/more_service.dart';

abstract class MoreRepository {
  Future<GetAccountDetails> getAccountDetails();
}

class MoreImpl implements MoreRepository {
  final MoreService _moreService;

  MoreImpl(this._moreService);

  @override
  Future<GetAccountDetails> getAccountDetails() async =>
      _moreService.getAccountDetails();
}
