import 'package:beta_sms_mobile/presentation/route.dart';
import 'package:beta_sms_mobile/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final appRouteProvider = ref.watch(routeProvider);
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: ((context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: themeData(),
          routerConfig: appRouteProvider,
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 0.98),
              child: child!,
            );
          },
        );
      }),
    );
  }
}
