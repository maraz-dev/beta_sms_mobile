import 'dart:async';
import 'dart:developer';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
//import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternet() async {
  try {
    final res = await InternetConnectionChecker().hasConnection;
    // final connectivityResult = await (Connectivity().checkConnectivity());
    if (!res) {
      throw "check your internet connection and try again";
    } else {
      return res;
    }
  } catch (e) {
    throw e.toString();
  }
}

final connectionProvider = StreamProvider.autoDispose((ref) async* {
  StreamController<InternetConnectionStatus> stream =
      StreamController<InternetConnectionStatus>();

  var listener =
      InternetConnectionChecker().onStatusChange.listen((status) async {
    switch (status) {
      case InternetConnectionStatus.connected:
        break;
      case InternetConnectionStatus.disconnected:
        // Fluttertoast.showToast(
        //     msg: "check your internet connection",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.TOP,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: AppColors.primaryColor,
        //     textColor: AppColors.secondaryColor,
        //     fontSize: 14.sp);
        break;
    }
    stream.add(status);
  });

  await for (final value in stream.stream) {
    log('stream value => ${value.toString()}');
    yield value;
  }
  ref.onDispose(() {
    stream.close();
    listener.cancel();
  });
});
