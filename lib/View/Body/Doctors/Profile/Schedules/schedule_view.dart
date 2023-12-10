import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../../../Universal Reuseable Widgets/Widgets/text.dart';
import '../../../../../ViewModel/Body/Doctors/Profile/Schedules/schedule_viewmodel.dart';
import '../../../HomeHome/Services/services.dart';

class ScheduleViews extends StatelessWidget {
  const ScheduleViews({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => ScheduleViewModel(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.black,
                ),
              ),
              title: Header3Text(
                text: 'Book an Appointment',
                color: Colors.black,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 5.h, bottom: 10.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(
                  //   height: 30.h,
                  // ),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       // MaterialButton(
                  //       //   color: Colors.blue.shade900,
                  //       //   elevation: 10,
                  //       //   padding: EdgeInsets.symmetric(
                  //       //       vertical: 10.h, horizontal: 20.w),
                  //       //   onPressed: () {
                  //       //     model.selectADate(context);
                  //       //   },
                  //       //   child: const Text(
                  //       //     'Pick a Date',
                  //       //     style: TextStyle(color: Colors.white),
                  //       //   ),
                  //       // ),
                  //       MaterialButton(
                  //         color: Colors.blue.shade900,
                  //         elevation: 10,
                  //         padding: EdgeInsets.only(
                  //             left: 15.w, right: 15.w, top: 10.h, bottom: 10.h),
                  //         onPressed: () {
                  //           model.selectTime(context);
                  //         },
                  //         child: const Text(
                  //           'Pick a Time',
                  //           style: TextStyle(color: Colors.white),
                  //         ),
                  //       ),
                  //     ]),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Header3Text(text: 'Scheduled Appointments')),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return const AppointmentWidget(
                          date: 'Monday, Dec 23',
                          time: '12:00 - 13:00',
                          docName: 'Nurse Kunle',
                          description: 'Digestive Advice',
                        );
                      },
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      model.selectTime(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        border: Border.all(
                          color: Colors.black45,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 70.h,
                            width: 70.w,
                            child: Icon(
                              Icons.access_time,
                              size: 30.sp,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(
                                    color: Colors.blue.shade200,
                                    fontSize: 20.sp),
                              ),
                              Text(
                                '${model.dateTime.day} / ${model.dateTime
                                    .month}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Time',
                                style: TextStyle(
                                    color: Colors.blue.shade200,
                                    fontSize: 20.sp),
                              ),
                              Text(
                                model.timing.format(context),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp),
                              ),
                            ],
                          ),
                          const Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 200.w,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900,
                        borderRadius: BorderRadius.circular(12.r)),
                    margin:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    padding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                    child: Center(
                      child: Text(
                        'Book Now',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                            color: Colors.white),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  //schedules

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
