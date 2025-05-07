import 'package:beta_sms_mobile/presentation/utils/app_date_picker.dart';
import 'package:beta_sms_mobile/presentation/utils/app_images.dart';
import 'package:beta_sms_mobile/presentation/utils/buttons.dart';
import 'package:beta_sms_mobile/presentation/utils/input_fields.dart';
import 'package:beta_sms_mobile/presentation/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SendLaterSheet extends StatefulWidget {
  const SendLaterSheet({super.key});

  @override
  State<SendLaterSheet> createState() => _SendLaterSheetState();
}

class _SendLaterSheetState extends State<SendLaterSheet> {
  final TextEditingController _date = TextEditingController();
  final TextEditingController _time = TextEditingController();
  DateTime _dob = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send SMS Later',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 10.h),
          const Text('Configure when to deliver the bulk SMS'),
          SizedBox(height: 20.h),
          CardInput(
            readOnly: true,
            fieldName: "Choose Date",
            controller: _date,
            hint: '',
            isDateOrTime: true,
            dateOrTimeImage: AppImages.calenderIcon,
            onPressed: () async {
              final value = await showPlatformDatePicker(
                context: context,
                initialDate: _dob,
                firstDate: DateTime(1900),
                lastDate: DateTime(3100),
              );
              if (value == null) return;
              var formatter = DateFormat('yyyy-MM-dd');
              String formattedDate = formatter.format(value);
              setState(() {
                _dob = value;
                _date.text = formattedDate;
              });
            },
            inputType: TextInputType.name,
            validator: validateGeneric,
          ),
          SizedBox(height: 15.h),
          CardInput(
            readOnly: true,
            fieldName: "Choose Time",
            controller: _time,
            hint: '',
            isDateOrTime: true,
            dateOrTimeImage: AppImages.clockIcon,
            onPressed: () async {
              final value = await showPlatformTimePicker(
                  context: context, initialTime: TimeOfDay.now());
              if (value == null) return;
              // print(value);
              // Convert TimeOfDay to DateTime
              DateTime dateTime = DateTime(
                  _dob.year, _dob.month, _dob.day, value.hour, value.minute);

              // Format DateTime as "11:27 AM"
              String formattedTime = DateFormat.jm().format(dateTime);

              setState(() {
                _timeOfDay = value;
                _time.text = formattedTime;
              });
            },
            inputType: TextInputType.name,
            validator: validateGeneric,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: MainButton(text: 'Continue', onPressed: () {}),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
