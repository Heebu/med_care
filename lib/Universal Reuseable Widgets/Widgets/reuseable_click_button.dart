import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ClickButton extends StatelessWidget {
  ClickButton({
    Key? key,
    required this.text,
    this.color,
    this.boxColor,
    this.size,
    this.widget,
  }) : super(key: key);
  final String text;
  Widget? widget;
  double? size;
  Color? color = Colors.white;
  Color? boxColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: size?.sp,
            ),
          ),
        ),
      ),
    );
  }
}
