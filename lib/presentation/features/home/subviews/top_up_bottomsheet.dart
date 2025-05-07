import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/use_bank_transfer.dart';
import 'package:beta_sms_mobile/presentation/utils/use_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopUpWidget extends ConsumerStatefulWidget {
  const TopUpWidget({
    super.key,
  });

  @override
  ConsumerState<TopUpWidget> createState() => _TopUpWidgetState();
}

class _TopUpWidgetState extends ConsumerState<TopUpWidget>
    with SingleTickerProviderStateMixin {
  late TabController _methodTabController;

  @override
  void initState() {
    super.initState();
    _methodTabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
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
      ),
    );
  }
}
