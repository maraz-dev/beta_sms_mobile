import 'package:beta_sms_mobile/presentation/features/sms/details_analytics_tab.dart';
import 'package:beta_sms_mobile/presentation/features/sms/details_messages_tab.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SMSDetailsScreen extends StatefulWidget {
  static String path = 'smsDetailsScreen';
  const SMSDetailsScreen({super.key});

  @override
  State<SMSDetailsScreen> createState() => _SMSScreenState();
}

class _SMSScreenState extends State<SMSDetailsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _detailsTabController;

  @override
  void initState() {
    super.initState();
    _detailsTabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
            decoration: const BoxDecoration(
              color: AppColors.kDarkBlue,
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.kBorderColor,
                        ),
                      ),
                      Text(
                        'SMS Details',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.kWhite,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 40.h,
                    child: TabBar(
                      controller: _detailsTabController,
                      labelColor: AppColors.kYellow,
                      unselectedLabelColor: AppColors.kUnselectedTabText,
                      dividerHeight: 0,
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
                          EdgeInsets.symmetric(horizontal: 20.w, vertical: 0.h),
                      tabs: const [
                        Tab(text: 'Message'),
                        Tab(text: 'Analytics'),
                      ],
                    ),
                  ),
                  SizedBox(height: 0.h),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _detailsTabController,
              children: const [
                DetailsMessageTab(),
                DetailsAnalyticsTab(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class GradientBorderPainter extends CustomPainter {
  final Gradient gradient;
  final double strokeWidth;

  GradientBorderPainter({
    required this.gradient,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Offset.zero & size;
    final Paint paint = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(100.r)),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
