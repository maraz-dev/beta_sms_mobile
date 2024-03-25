import 'package:beta_sms_mobile/data/models/responses/balance.dart';
import 'package:beta_sms_mobile/data/remote/home/home_service.dart';

abstract class HomeRepository {
  Future<Balance> getBalance();
}

class HomeImpl implements HomeRepository {
  final HomeService _dashboardService;

  HomeImpl(this._dashboardService);
  @override
  Future<Balance> getBalance() async => await _dashboardService.getBalance();
}
