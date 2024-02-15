import 'package:beta_sms_mobile/presentation/features/more/subviews/contact_card.dart';
import 'package:beta_sms_mobile/presentation/theme/colors.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsTab extends StatefulWidget {
  const ContactsTab({
    super.key,
  });

  @override
  State<ContactsTab> createState() => _ContactsTabState();
}

class _ContactsTabState extends State<ContactsTab> {
  ///
  final TextEditingController _listName = TextEditingController();

  ///
  List<String> nameList = ['Acumen Digital', 'International', 'Church'];

  ///
  //final GlobalKey<State> _keyA = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListInput(
              fieldName: 'Select List Name',
              controller: _listName,
              hint: '',
              inputType: TextInputType.name,
              validator: null,
              onPressed: () async {},
            ),
          ),
          SizedBox(height: 30.h),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return const ContactCard();
                    },
                    separatorBuilder: (context, index) {
                      return const Line(thick: 2);
                    },
                    itemCount: 5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
