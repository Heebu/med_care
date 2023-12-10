import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../../ViewModel/Body/Profile/Appointments/appointment_viewmodel.dart';
import '../../HomeHome/Services/services.dart';

class AppointmentView extends StatelessWidget {
  const AppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => AppointmentViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Scheduled Appointments'),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
          child: ListView.separated(
              itemBuilder: (context, index) => const AppointmentWidget(
                    date: '12 March, 2024',
                    time: '12:00am',
                    docName: 'Dr Adedeji',
                    description: 'Counselling',
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 5.h,
                  ),
              itemCount: 20),
        ),
      ),
    );
  }
}
