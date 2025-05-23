import 'package:beta_sms_mobile/data/local/user_data_impl.dart';
import 'package:beta_sms_mobile/data/models/responses/user_profile.dart';
import 'package:beta_sms_mobile/presentation/features/auth/login_screen.dart';
import 'package:beta_sms_mobile/presentation/features/more/contacts_tab.dart';
import 'package:beta_sms_mobile/presentation/features/more/securities_tab.dart';
import 'package:beta_sms_mobile/presentation/features/more/settings_tab.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/filter_icon.dart';
import 'package:beta_sms_mobile/presentation/utils/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MoreScreen extends ConsumerStatefulWidget {
  const MoreScreen({super.key});

  @override
  ConsumerState<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends ConsumerState<MoreScreen>
    with SingleTickerProviderStateMixin {
  late TabController _moreTabController;

  @override
  void initState() {
    super.initState();
    _moreTabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(localUserProvider);
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'More',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.kWhite,
                            fontWeight: FontWeight.w500),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.replaceNamed(LoginScreen.path);
                        },
                        child: Text(
                          'Log Out',
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColors.kRed,
                                  fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      const Expanded(child: SearchBox()),
                      SizedBox(width: 10.h),
                      const FilterIcon()
                    ],
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: 40.h,
                    child: TabBar(
                      controller: _moreTabController,
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
                        Tab(text: 'Contacts'),
                        Tab(text: 'Settings'),
                        Tab(text: 'Security'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: _moreTabController,
            children: [
              const ContactsTab(),
              SettingsTab(
                user: user.value ?? UserResponse(),
              ),
              const SecurityTab(),
            ],
          ))
        ],
      ),
    );
  }
}
