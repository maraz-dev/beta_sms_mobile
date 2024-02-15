import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  final Color color;
  final double thick;
  const Line({
    super.key,
    this.color = AppColors.kBackgroundColor,
    this.thick = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      height: 30,
      thickness: thick,
    );
  }
}
