import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({
    Key? key,
    required this.text,
    required this.image,
    required this.navigation,
  }) : super(key: key);

  final String text;
  final String image;
  final Widget navigation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => navigation,
          ),
        );
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.h, top: 5.h),
            child: Container(
                width: 80.h,
                height: 60.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      image,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.transparent,
                )),
          ),
          Center(
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
