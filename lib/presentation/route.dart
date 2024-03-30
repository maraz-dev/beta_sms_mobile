import 'package:beta_sms_mobile/presentation/features/auth/create_account_screen.dart';
import 'package:beta_sms_mobile/presentation/features/auth/login_screen.dart';
import 'package:beta_sms_mobile/presentation/features/auth/otp_screen.dart';
import 'package:beta_sms_mobile/presentation/features/dashboard/dashboard.dart';
import 'package:beta_sms_mobile/presentation/features/onboarding/onboarding_screen.dart';
import 'package:beta_sms_mobile/presentation/features/sms/bulk_send_sms.dart';
import 'package:beta_sms_mobile/presentation/features/sms/quick_send_sms.dart';
import 'package:beta_sms_mobile/presentation/features/sms/sms_details_screen.dart';
import 'package:beta_sms_mobile/presentation/features/sms/sms_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigation = GlobalKey(debugLabel: "root");
final GlobalKey<NavigatorState> shellNavigation =
    GlobalKey(debugLabel: "shell");

final routeProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: "/",
      navigatorKey: rootNavigation,
      debugLogDiagnostics: true,
      restorationScopeId: "app",
      redirect: (context, state) {
        return null;
      },
      routes: [
        GoRoute(
          path: "/",
          name: OnboardingScreen.path,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: LoginScreen.path,
          name: LoginScreen.path,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: CreateAccountScreen.path,
          name: CreateAccountScreen.path,
          builder: (context, state) => const CreateAccountScreen(),
          routes: [
            GoRoute(
              path: OTPVerificationScreen.path,
              name: OTPVerificationScreen.path,
              builder: (context, state) => const OTPVerificationScreen(),
            )
          ],
        ),
        GoRoute(
          path: Dashboard.path,
          name: Dashboard.path,
          builder: (context, state) => const Dashboard(),
        ),
        GoRoute(
            path: SMSScreen.path,
            name: SMSScreen.path,
            builder: (context, state) => const SMSScreen(),
            routes: [
              GoRoute(
                path: SMSDetailsScreen.path,
                name: SMSDetailsScreen.path,
                builder: (context, state) => const SMSDetailsScreen(),
              ),
            ]),
        GoRoute(
          path: SendBulkSMSScreen.path,
          name: SendBulkSMSScreen.path,
          builder: (context, state) => const SendBulkSMSScreen(),
        ),
        GoRoute(
          path: QuickSendSMSScreen.path,
          name: QuickSendSMSScreen.path,
          builder: (context, state) => const QuickSendSMSScreen(),
        ),
      ]);
});
