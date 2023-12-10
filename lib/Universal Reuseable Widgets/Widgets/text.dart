import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utils/my_sizez.dart';

class Header1Text extends StatelessWidget {
  Header1Text({
    Key? key,
    required this.text,
    this.color,
  }) : super(key: key);
  final String text;
  Color? color = CupertinoColors.darkBackgroundGray;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 40.sp,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }
}

class Header2Text extends StatelessWidget {
  Header2Text({super.key, required this.text, this.color});

  final String text;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: FontWeight.w700, fontSize: 30.sp, color: color),
    );
  }
}

class Header3Text extends StatelessWidget {
  Header3Text({super.key, required this.text, this.color});

  final String text;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: FontWeight.w700, fontSize: 15.sp, color: color),
    );
  }
}

class Text1 extends StatelessWidget {
  Text1({
    super.key, required this.text,
    this.color = Colors.black
  });
  final String text;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Text(text, style: TextStyle(fontSize: MySizes().text1Size, fontWeight: FontWeight.bold, color: color)),
    );
  }
}

class Text2 extends StatelessWidget {
  Text2({
    super.key, required this.text,
    this.color = Colors.black
  });
  final String text;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Text(text, style: TextStyle(fontSize: MySizes().text2Size, fontWeight: FontWeight.bold, color: color)),
    );
  }
}

class Text3 extends StatelessWidget {
  Text3({
    super.key, required this.text,
    this.color = Colors.black,
  });
  final String text;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Text(text, style: TextStyle(fontSize: MySizes().text3Size, fontWeight: FontWeight.normal, color: color)),
    );
  }
}

class Text4 extends StatelessWidget {
  Text4({
    super.key, required this.text,
    this.color = Colors.black
  });
  final String text;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Text(text, style: TextStyle(fontSize: MySizes().text4Size,  color: color)),
    );
  }
}
