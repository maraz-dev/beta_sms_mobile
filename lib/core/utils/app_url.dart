import 'package:beta_sms_mobile/core/third-party/environment.dart';
import 'package:beta_sms_mobile/core/utils/logger.dart';

class ApiEndpoints {
  static final ApiEndpoints _instance = ApiEndpoints._privateConstructor();
  static ApiEndpoints get instance => _instance;
  static Environmentx? _environment;

  ApiEndpoints._privateConstructor() {
    if (_environment == null) {
      logger.info(
        "${"ApiEndpoints----->"} ,Call init to set the environment, environment set to dev by default",
      );
      _environment = Environmentx.dev;
    }
  }

  /// Set Environment
  static void init(Environmentx environment) {
    _environment = environment;
  }

  static const String devURL =
      "https://ddbm7ddptd.execute-api.eu-west-1.amazonaws.com/dev/api/v1";
  static const String productionURL = "";

  static final baseUrl =
      _environment == Environmentx.prod ? productionURL : devURL;

  /// version
  String get version => "v1";

  /// Authentication
  String get login => "/Authentication/login";
  String get forgotPassword => "/Authentication/ForgotPassword";

  /// Onboarding
  String get createAccount => "/Onboarding/AddUser";
  String get sendOtp => "/Onboarding/SendOtp";
  String get validateOtp => "/Onboarding/ValidateOtp";

  /// SMS
  String get sendQuickSMS => "/SmsManagement/SendMessage";

  ///Refresh Token
  String get refresh => "/$version/auth/refresh";

  /// Auth Token
  String get token => "accessToken";
  String get unlockPass => "unlockPass";
  String get enabled => "enabled";
  String get disabled => "disabled";
  String get status => "status";
  String get refreshToken => "refreshToken";

  /// Transactions
  String get allTransactions => "/transactions";

  String userTransactions(String id) => '/users/$id/transactions';
  String get sentTransactions => "/$version/transactions/sent";
  String get transactionOtp => "/$version/otp";
  String get transactionDetails => "/$version/transactions/";
}

enum Environment { dev, prod }
