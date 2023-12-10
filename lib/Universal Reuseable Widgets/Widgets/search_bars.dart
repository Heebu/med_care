import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBars extends StatelessWidget {
  const SearchBars({
    Key? key,
    required this.text,
    required this.widget,
  }) : super(key: key);
  final String text;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: Colors.blue.shade50,
      ),
      height: 50.h,
      width: double.maxFinite,
      child: Padding(
        padding: EdgeInsets.only(
          left: 10.w,
          right: 20.w,
        ),
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 200.w,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search_rounded,
                    size: 30.sp,
                  ),
                  enabledBorder: InputBorder.none,
                  hintText: text,
                ),
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return widget;
                    });
              },
              icon: Icon(
                Icons.tune,
                size: 30.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
