import 'package:beta_sms_mobile/presentation/features/sms/sms_details_screen.dart';
import 'package:beta_sms_mobile/presentation/features/sms/subviews/message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MessagesTab extends StatelessWidget {
  const MessagesTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.pushNamed(SMSDetailsScreen.path);
                },
                child: const MessageCard(),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.h);
            },
            itemCount: 5),
      ),
    );
  }
}
