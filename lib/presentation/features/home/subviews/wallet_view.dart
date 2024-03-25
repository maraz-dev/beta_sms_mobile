import 'package:beta_sms_mobile/presentation/features/home/subviews/top_up_bottomsheet.dart';
import 'package:beta_sms_mobile/presentation/features/home/vm/home_providers.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_bottomsheet.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/extensions.dart';
import 'package:beta_sms_mobile/presentation/utils/use_bank_transfer.dart';
import 'package:beta_sms_mobile/presentation/utils/use_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WalletView extends ConsumerStatefulWidget {
  const WalletView({
    super.key,
  });

  @override
  ConsumerState<WalletView> createState() => _WalletViewState();
}

class _WalletViewState extends ConsumerState<WalletView> {
  @override
  Widget build(BuildContext context) {
    final balance = ref.watch(balanceProvider);
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
              balance.isLoading
                  ? 'N ---'
                  : 'N${balance.value?.balance?.amountInt() ?? 0.00}',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: AppColors.kWhite, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              balance.isLoading
                  ? '--- UNITS'
                  : '${balance.value?.unit?.toString() ?? 0.00} UNITS',
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
