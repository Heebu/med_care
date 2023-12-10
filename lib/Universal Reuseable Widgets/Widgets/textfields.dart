import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_care/Universal%20Reuseable%20Widgets/Widgets/my_icon.dart';

class TextFieldText extends StatelessWidget {
  TextFieldText({
    Key? key,
    required this.text,
    required this.icon,
this.controller,
    this.hint,
    this.textInputType,
  }) : super(key: key);
  final String text;
  final IconData icon;
  String? hint;
  TextInputType? textInputType;

 TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(
            vertical: 5.h
          ),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                borderRadius: BorderRadius.circular(20.r),
                color: Colors.blueGrey.shade50),
            padding: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
            ),
            margin: EdgeInsets.only(
              // left: 20,
              right: 10.w,
            ),
            child: TextField(
              controller: controller,
              obscureText: text=='Password'? true: false,
              textCapitalization: TextCapitalization.sentences,
              keyboardType: textInputType,
              decoration: InputDecoration(
                border: InputBorder.none,
                icon: MyIcon(icon: icon,),
                hintText: text,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }
}

class TextFieldText2 extends StatelessWidget {
  const TextFieldText2({Key? key, required this.hint}) : super(key: key);
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.blueGrey.shade50),
          padding: EdgeInsets.only(
            left: 20.w,
            right: 10.w,
          ),
          margin: EdgeInsets.only(
            // left: 20,
            right: 10.h,
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        )
      ],
    );
  }
}

class Password extends StatelessWidget {
   Password({Key? key,
     required this.passwordController,
     this.text,
   }) : super(key: key);
  final TextEditingController passwordController;
  String? text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        vertical: 10.h
      ),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 0.5),
            borderRadius: BorderRadius.circular(20.r),
            color: Colors.blueGrey.shade50),
        padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 5.h
        ),
        margin: EdgeInsets.only(
          // left: 20,
          right: 10.w,
        ),
        child: TextField(
          controller: passwordController,
          obscureText: true,
          decoration:  InputDecoration(
              border: InputBorder.none,
              hintText: text,
              icon: MyIcon(icon: Icons.password),),
        ),
      ),
    )
    ;
  }
}
