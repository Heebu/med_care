import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Utils/app_colors.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Widgets/text.dart';

class HeadTitles extends StatelessWidget {
  HeadTitles({Key? key, required this.text, this.size}) : super(key: key);
  final String text;
  double? size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            'MedCare',
            style: TextStyle(
              color: Colors.blue.shade900,
              fontSize: 40.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Text1(text: text, color: MyAppColors().iconColor,)

        ),
      ],
    );
  }
}
