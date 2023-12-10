import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Services
class Services extends StatelessWidget {
  const Services({
    Key? key,
    required this.icons,
    required this.text,
    required this.colors,
    required this.boxColor,
    required this.navigator,
  }) : super(key: key);

  final IconData icons;
  final String text;
  final Color colors;
  final Color boxColor;
  final Widget navigator;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigator),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1.w, color: Colors.blue.shade900),
          color: boxColor,
          borderRadius: BorderRadius.circular(
            12.r,
          ),
          boxShadow: const [
            BoxShadow(offset: Offset(-2, 5), blurRadius: 3, color: Colors.grey),
          ],
        ),
        margin: EdgeInsets.only(right: 10.w),
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icons,
              color: colors,
              size: 40.sp,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Appointment widget
class AppointmentWidget extends StatelessWidget {
  const AppointmentWidget({
    Key? key,
    required this.date,
    required this.time,
    required this.docName,
    required this.description,
  }) : super(key: key);
  final String date;
  final String time;
  final String docName;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blue.shade900,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  docName,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                ),
                const Spacer(),
                Icon(
                  Icons.description,
                  color: Colors.blue.shade900,
                  size: 10.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  description,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.perm_contact_calendar_sharp,
                  color: Colors.blue.shade900,
                ),
                SizedBox(
                  width: 3.w,
                ),
                Text(
                  date,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                ),
                const Spacer(),
                Icon(
                  Icons.access_time,
                  color: Colors.blue.shade900,
                  size: 10.sp,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  time,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                ),
              ],
            ),
          ],
        ));
  }
}

//Top Rated Doctors
class TopRatedDoctors extends StatelessWidget {
  const TopRatedDoctors({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Container(
        height: 150.h,
        width: 250.w,
        margin: EdgeInsets.only(right: 20.w),
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(offset: Offset(-2, 5), blurRadius: 3, color: Colors.grey),
          ],
          border: Border.all(width: 1.w),
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 40.r,
                ),
                const Spacer(),
                SizedBox(
                  width: 150.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      Text(
                        'MBBS, ND-HND-Ophthmology',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.black26,
                        ),
                      ),
                      const Row(
                        children: [
                          ReuseableStar(),
                          ReuseableStar(),
                          ReuseableStar(),
                          ReuseableStar(),
                          ReuseableStar(),
                        ],
                      ),
                      Text(
                        'Saint Francis Memorial Hospital',
                        style: TextStyle(
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Reuseable Stars
class ReuseableStar extends StatelessWidget {
  const ReuseableStar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: Colors.lightGreenAccent.shade200,
      size: 15,
    );
  }
}
