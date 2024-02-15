import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_bottomsheet.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/extensions.dart';
import 'package:beta_sms_mobile/presentation/utils/use_bank_transfer.dart';
import 'package:beta_sms_mobile/presentation/utils/use_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletView extends StatelessWidget {
  final double balance;
  final double units;
  const WalletView({
    super.key,
    required this.balance,
    required this.units,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'WALLET BALANCE',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.kPrimaryColor,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'N${balance.amountInt()}',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColors.kWhite, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${units.toString()} UNITS',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.kLightGrey,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
        const Spacer(),
        Expanded(
            child: MainButton(
                text: 'TOP UP',
                onPressed: () {
                  AppBottomSheet.showBottomSheet(context,
                      widget: const TopUpWidget());
                }))
      ],
    );
  }
}

class TopUpWidget extends StatefulWidget {
  const TopUpWidget({
    super.key,
  });

  @override
  State<TopUpWidget> createState() => _TopUpWidgetState();
}

class _TopUpWidgetState extends State<TopUpWidget>
    with SingleTickerProviderStateMixin {
  late TabController _methodTabController;

  @override
  void initState() {
    super.initState();
    _methodTabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Top Up Wallet',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 40.h,
          child: TabBar(
            controller: _methodTabController,
            labelColor: AppColors.kBlack,
            unselectedLabelColor: AppColors.kUnselectedTabText,
            labelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500),
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(fontWeight: FontWeight.w500),
            indicator: BoxDecoration(
                color: AppColors.kYellow.withOpacity(0.4),
                borderRadius: BorderRadius.circular(10.r)),
            indicatorSize: TabBarIndicatorSize.tab,
            padding: EdgeInsets.symmetric(horizontal: 0.h, vertical: 0.h),
            tabs: const [
              Tab(text: 'Use Card'),
              Tab(text: 'Use Bank Transfer'),
            ],
          ),
        ),
        const Divider(
          height: 0,
          color: AppColors.kBorderColor,
          thickness: 1,
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 400.h,
          child: TabBarView(
            controller: _methodTabController,
            children: const [
              UseCardSheet(),
              UseBankTransferSheet(),
            ],
          ),
        )
      ],
    );
  }
}
