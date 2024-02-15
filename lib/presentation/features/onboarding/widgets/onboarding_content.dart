import 'package:beta_sms_mobile/presentation/utils/app_images.dart';

class OnboardingContent {
  final String image;
  final String title;
  final String subtitle;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.subtitle,
  });
}

List<OnboardingContent> content = [
  OnboardingContent(
      image: AppImages.onboardingOne,
      title: 'Receive Replies from your Customers',
      subtitle:
          'Localize your Communications and Handle Customer Replies Within our Platform.'),
  OnboardingContent(
      image: AppImages.onboardingTwo,
      title: 'Receive Replies from your Customers',
      subtitle:
          'Localize your Communications and Handle Customer Replies Within our Platform.'),
  OnboardingContent(
      image: AppImages.onboardingThree,
      title: 'Receive Replies from your Customers',
      subtitle:
          'Localize your Communications and Handle Customer Replies Within our Platform.')
];
