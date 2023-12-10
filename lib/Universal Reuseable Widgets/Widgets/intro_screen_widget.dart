import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Widgets/text.dart';

import '../Utils/my_sizez.dart';

class IntroScreenWidgets extends StatelessWidget {
  const IntroScreenWidgets({
    super.key, required this.title, required this.imagePath, required this.description, required this.backgroundColor, required this.textColor,
  });
  final String title;
  final String imagePath;
  final String description;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).height,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text1(text: title, color: textColor,),
          Container(
            height: 200.h,
            width: 250.w,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(imagePath))
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Text(description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: MySizes().text3Size, fontWeight: FontWeight.normal, color: textColor,)),
          ),
          SizedBox(height: 200.h,)
        ],),
    );
  }
}
