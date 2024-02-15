import 'package:beta_sms_mobile/presentation/features/home/subviews/wallet_view.dart';
import 'package:beta_sms_mobile/presentation/features/transactions/subviews/transaction_card.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _transactionTabController;

  @override
  void initState() {
    super.initState();
    _transactionTabController =
        TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: const BoxDecoration(
              color: AppColors.kDarkBlue,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'Transactions',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.kWhite, fontWeight: FontWeight.w500),
                  ),
                  const Line(),
                  SizedBox(height: 10.h),
                  const WalletView(balance: 15640.87, units: 200.3),
                  const Line(),
                  SizedBox(
                    height: 40.h,
                    child: TabBar(
                      controller: _transactionTabController,
                      labelColor: AppColors.kYellow,
                      unselectedLabelColor: AppColors.kUnselectedTabText,
                      labelStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                      unselectedLabelStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                      indicatorColor: AppColors.kYellow,
                      indicatorSize: TabBarIndicatorSize.label,
                      padding:
                          EdgeInsets.symmetric(horizontal: 0.h, vertical: 0.h),
                      tabs: const [
                        Tab(text: 'All'),
                        Tab(text: 'Credits'),
                        Tab(text: 'Debits'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _transactionTabController,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TransactionCard(
                          description: 'Bulk SMS Transaction',
                          time: '22, JAN. 2021 - 3:34PM',
                          amount: 30530.87,
                          isDebit: true,
                        ),
                        Line(
                          color: AppColors.kBorderColor,
                          thick: 1.2,
                        ),
                        TransactionCard(
                          description: 'Account Top-up',
                          time: '22, JAN. 2021 - 3:34PM',
                          amount: 30530.87,
                          isDebit: false,
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Text('Credits'),
                ),
                Center(
                  child: Text('Debits'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
