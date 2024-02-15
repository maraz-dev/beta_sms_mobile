import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RoundedIcon extends StatelessWidget {
  final String image;
  const RoundedIcon({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: AppColors.kYellow),
      child: SvgPicture.asset(image),
    );
  }
}
