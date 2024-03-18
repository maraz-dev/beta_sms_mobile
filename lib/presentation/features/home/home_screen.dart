import 'package:beta_sms_mobile/data/local/user_data_impl.dart';
import 'package:beta_sms_mobile/presentation/features/home/subviews/home_image.dart';
import 'package:beta_sms_mobile/presentation/features/home/subviews/more_solutions_widget.dart';
import 'package:beta_sms_mobile/presentation/features/home/subviews/wallet_view.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  /// Method to determine greeting based on time of the day
  String greeting() {
    var hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning,';
    } else if (hour < 16) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening,';
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(localUserProvider);
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            decoration: const BoxDecoration(
              color: AppColors.kDarkBlue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.kYellow,
                        radius: 25.r,
                      ),
                      SizedBox(width: 10.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            greeting(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.kYellow),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'Ajibola',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: AppColors.kWhite,
                                    fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Stack(
                        children: [
                          SvgPicture.asset(AppImages.notificationIcon),
                          FractionalTranslation(
                              translation: Offset(1.2.w, -0.1.h),
                              child: CircleAvatar(
                                backgroundColor: AppColors.kYellow,
                                radius: 5.r,
                              ))
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 50.h),
                  const WalletView(balance: 15640.87, units: 200.3)
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    'More Solutions',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 10.h),
                  MoreSolutionsWidget(
                    title: 'Launch powerful SMS campaigns to your audience.',
                    subtitle:
                        'Create, personalize, and launch SMS campaigns from a simple step by step editor.',
                    buttonText: 'Send Bulk SMS',
                    onPressed: () {},
                  ),
                  SizedBox(height: 20.h),
                  MoreSolutionsWidget(
                    title:
                        'Schedule Communications,\nDownload reports at will.',
                    subtitle:
                        'Effortlessly manage your voice  communications with our user-friendly software.',
                    buttonText: 'Schedule Bulk SMS',
                    onPressed: () {},
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).width * 0.5,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return const HomeImage();
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 15.w);
                      },
                    ),
                  ),
                  SizedBox(height: 20.h),
                  MoreSolutionsWidget(
                    isDeveloper: true,
                    title: 'Automate Communication Flows.',
                    subtitle:
                        'Automate notifications and provide support through our omni-channel SMS API',
                    buttonText: 'Learn More',
                    onPressed: () {},
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            )),
          )
        ],
      ),
    );
  }
}
