import 'package:beta_sms_mobile/presentation/features/auth/create_account_screen.dart';
import 'package:beta_sms_mobile/presentation/features/auth/login_screen.dart';
import 'package:beta_sms_mobile/presentation/features/onboarding/widgets/onboarding_content.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  static String path = '/onboardingScreen';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            content[currentIndex].image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 12.w),
                child: Image.asset(
                  AppImages.betaSmsLogo,
                  width: 64.w,
                  height: 64.h,
                ),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: content.length,
                  onPageChanged: (value) {
                    setState(() {
                      currentIndex = value;
                    });
                  },
                  itemBuilder: (context, index) {
                    var page = content[index];
                    return SafeArea(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  page.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                        color: AppColors.kWhite,
                                      ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Text(
                                  page.subtitle,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          color: AppColors.kWhite,
                                          fontWeight: FontWeight.w400),
                                ),
                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: content.length,
                        effect: WormEffect(
                          activeDotColor: AppColors.kPrimaryColor,
                          dotColor: AppColors.kPrimaryColor.withOpacity(0.2),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      MainButton(
                        text: 'Create An Account',
                        onPressed: () => context
                            .pushReplacementNamed(CreateAccountScreen.path),
                        isPrimary: false,
                        color: AppColors.kSecondaryColor,
                        textColor: AppColors.kBlack,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      GestureDetector(
                        onTap: () =>
                            context.pushReplacementNamed(LoginScreen.path),
                        child: Center(
                          child: Text(
                            'Sign In',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.kWhite),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
