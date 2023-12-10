import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Universal Reuseable Widgets/Widgets/text.dart';


class Category extends StatelessWidget {
  const Category({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
      child: Container(
        height: 30.h,
        decoration: BoxDecoration(
            border: Border.all(width: 2.w, color: Colors.blue.shade900),
            borderRadius: BorderRadius.circular(30.r),
            // boxShadow: const [
            //   BoxShadow(
            //       offset: Offset(-2, 5), blurRadius: 3, color: Colors.grey),
            // ],
            color: color),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 15.sp, color: Colors.blue.shade900),
          ),
        ),
      ),
    );
  }
}

class RatedDoctors extends StatelessWidget {
  const RatedDoctors({
    Key? key,
    required this.name,
    required this.image,
  }) : super(key: key);
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
        bottom: 10.h,
      ),
      child: Row(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  image,
                ),
              ),
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Text('Cardiologist in apollo hospital'),
                SizedBox(
                  width: 10.w,
                ),
                const StarRatings(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PharmacyCards extends StatelessWidget {
  const PharmacyCards({
    Key? key,
    required this.name,
    required this.image,
    required this.location,
  }) : super(key: key);
  final String name;
  final String image;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
        bottom: 10.h,
      ),
      child: Row(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  image,
                ),
              ),
              borderRadius: BorderRadius.circular(20.r),
              color: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
                Text(location),
                SizedBox(
                  width: 10.w,
                ),
                const StarRatings(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StarRatings extends StatelessWidget {
  const StarRatings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.orange,
        ),
        Header3Text(text: '4.5'),
        Text(
          ' 17 reviews',
          style: TextStyle(color: Colors.blue.shade200),
        ),
      ],
    );
  }
}
