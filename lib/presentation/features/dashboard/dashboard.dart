import 'package:beta_sms_mobile/presentation/features/dashboard/subviews/send_sms_sheet.dart';
import 'package:beta_sms_mobile/presentation/features/home/home_screen.dart';
import 'package:beta_sms_mobile/presentation/features/more/more_screen.dart';
import 'package:beta_sms_mobile/presentation/features/sms/sms_screen.dart';
import 'package:beta_sms_mobile/presentation/features/transactions/transactions_screen.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_bottomsheet.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  static String path = '/dashboardScreen';

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  int currentIndex = 0;
  List<Widget> pageList = [
    const HomeScreen(),
    const SMSScreen(),
    const Center(child: Text('')),
    const TransactionsScreen(),
    const MoreScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            color: AppColors.kWhite,
            border: Border.all(
              color: AppColors.kBorderColor,
            )),
        child: Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              if (value != 2) {
                setState(() {
                  currentIndex = value;
                });
              }
            },
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            iconSize: 18,
            selectedLabelStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
              color: AppColors.kPrimaryColor,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              letterSpacing: 0,
              color: AppColors.kTextColor,
            ),
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImages.homeIcon),
                  activeIcon: SvgPicture.asset(
                    AppImages.activeHomeIcon,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImages.smsIcon),
                  activeIcon: SvgPicture.asset(AppImages.activeSmsIcon),
                  label: 'SMS'),
              BottomNavigationBarItem(
                  icon: Container(), activeIcon: Container(), label: 'Send'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImages.transactionIcon),
                  activeIcon: SvgPicture.asset(AppImages.activeTransactionIcon),
                  label: 'Transactions'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppImages.moreIcon),
                  activeIcon: SvgPicture.asset(AppImages.activeMoreIcon),
                  label: 'More'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.transparent,
        elevation: 0,
        onPressed: () => AppBottomSheet.showBottomSheet(context,
            widget: const SendSMSSheet()),
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        child: Transform.translate(
          offset: const Offset(-2, 0),
          child: Center(
            child: SvgPicture.asset(
              AppImages.sendIcon,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
