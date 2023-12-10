import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Universal Reuseable Widgets/Widgets/text.dart';
import '../MessageDoctor/message.dart';
import '../Schedules/schedule_view.dart';

class DoctorProfile extends StatefulWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  State<DoctorProfile> createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue.shade900,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.white70,
            ),
          ),
          title: Header3Text(
            text: "Profile",
            color: Colors.white70,
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const Messages();
                  }),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.mail,
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200.h,
                width: double.maxFinite,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 70.r,
                      backgroundImage:
                          const AssetImage('assets/images/Idris.jpg'),
                    ),
                    Text(
                      'Dr. Adedeji Idris',
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.only(
                  left: 15.w,
                  right: 15.w,
                ),
                child: Container(
                  height: 100.h,
                  color: Colors.transparent,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileScroll(
                        text1: 'Patient',
                        text2: '100+',
                      ),
                      ProfileScroll(
                        text1: 'Exp.',
                        text2: '10 Yr',
                      ),
                      ProfileScroll(
                        text1: 'Rating',
                        text2: '4.67',
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                height: 80.h,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.blue.shade100,
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      margin: EdgeInsets.only(right: 15.w),
                      width: 70.w,
                      child: const Center(
                        child: Icon(Icons.access_time),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Text>[
                        Text(
                          'Available',
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text('Monday - Friday'),
                        Text(
                          '9am - 6pm',
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return const ScheduleViews();
                      }),
                    );
                  },
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(12.r)),
                    margin:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Center(
                      child: Text(
                        'Book an Appointment',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.sizeOf(context).height,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.h,
                    horizontal: 20.w,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Header3Text(text: 'About'),
                      Text('Ex- Professor & Head of Depertment'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScroll extends StatelessWidget {
  const ProfileScroll({
    Key? key,
    required this.text1,
    required this.text2,
  }) : super(key: key);

  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(width: 1.w, color: Colors.blue.shade900),
        boxShadow: const [
          BoxShadow(offset: Offset(-2, 5), blurRadius: 3, color: Colors.grey),
        ],
        color: Colors.blue.shade100,
      ),
      width: 100.w,
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text2,
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
                color: Colors.blue.shade900),
          ),
          Text(
            text1,
            style: TextStyle(fontSize: 17.sp),
          ),
        ],
      ),
    );
  }
}
