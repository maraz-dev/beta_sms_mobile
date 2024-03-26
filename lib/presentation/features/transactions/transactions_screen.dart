import 'package:beta_sms_mobile/presentation/features/home/subviews/wallet_view.dart';
import 'package:beta_sms_mobile/presentation/features/transactions/subviews/transaction_card.dart';
import 'package:beta_sms_mobile/presentation/features/transactions/vm/transaction_providers.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/extensions.dart';
import 'package:beta_sms_mobile/presentation/utils/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionsScreen extends ConsumerStatefulWidget {
  const TransactionsScreen({super.key});

  @override
  ConsumerState<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends ConsumerState<TransactionsScreen>
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
    final transactions = ref.watch(getTransactionsProvider);
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
                  const WalletView(),
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
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: transactions.maybeWhen(
                      data: (data) {
                        if (data.isEmpty) {
                          return const Center(
                            child: Text("You do not have any Transactions"),
                          );
                        } else {
                          return MediaQuery.removeViewPadding(
                            context: context,
                            removeTop: true,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: data.length,
                              itemBuilder: (context, index) {
                                final value = data[index];
                                return TransactionCard(
                                  description: value.description ?? "",
                                  time: value.dateCreated ?? DateTime.now(),
                                  amount: value.amount ?? 0,
                                  isDebit: value.type == "Cr" ? false : true,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Line(
                                  color: AppColors.kBorderColor,
                                  thick: 1.2,
                                );
                              },
                            ),
                          );
                        }
                      },
                      error: (error, stackTrace) => Center(
                            child: Text(
                              error.toString(),
                            ),
                          ),
                      orElse: () => const Center(
                            child: SpinKitRipple(
                              color: AppColors.kDarkBlue,
                            ),
                          )),
                ),

                /// Credit
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: transactions.maybeWhen(
                      data: (data) {
                        final realData = data
                            .where((element) => element.type == "Cr")
                            .toList();
                        if (realData.isEmpty) {
                          return const Center(
                            child:
                                Text("You do not have any Credit Transactions"),
                          );
                        } else {
                          return MediaQuery.removeViewPadding(
                            context: context,
                            removeTop: true,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: realData.length,
                              itemBuilder: (context, index) {
                                final value = realData[index];
                                if (value.type == "Cr") {
                                  return TransactionCard(
                                    description: value.description ?? "",
                                    time: value.dateCreated ?? DateTime.now(),
                                    amount: value.amount ?? 0,
                                    isDebit: value.type == "Cr" ? false : true,
                                  );
                                }
                                return Container();
                              },
                              separatorBuilder: (context, index) {
                                return const Line(
                                  color: AppColors.kBorderColor,
                                  thick: 1.2,
                                );
                              },
                            ),
                          );
                        }
                      },
                      error: (error, stackTrace) => Center(
                            child: Text(
                              error.toString(),
                            ),
                          ),
                      orElse: () => const Center(
                            child: SpinKitRipple(
                              color: AppColors.kDarkBlue,
                            ),
                          )),
                ),

                /// Debit
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  child: transactions.maybeWhen(
                      data: (data) {
                        final realData = data
                            .where((element) => element.type == "Dr")
                            .toList();
                        if (realData.isEmpty) {
                          return const Center(
                            child:
                                Text("You do not have any Debit Transactions"),
                          );
                        } else {
                          return MediaQuery.removeViewPadding(
                            context: context,
                            removeTop: true,
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: realData.length,
                              itemBuilder: (context, index) {
                                final value = realData[index];

                                return TransactionCard(
                                  description: value.description ?? "",
                                  time: value.dateCreated ?? DateTime.now(),
                                  amount: value.amount ?? 0,
                                  isDebit: value.type == "Cr" ? false : true,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Line(
                                  color: AppColors.kBorderColor,
                                  thick: 1.2,
                                );
                              },
                            ),
                          );
                        }
                      },
                      error: (error, stackTrace) => Center(
                            child: Text(
                              error.toString(),
                            ),
                          ),
                      orElse: () => const Center(
                            child: SpinKitRipple(
                              color: AppColors.kDarkBlue,
                            ),
                          )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
