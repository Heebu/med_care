import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:med_care/View/Body/Doctors/reuseables.dart';
import 'package:stacked/stacked.dart';
import '../../../Universal Reuseable Widgets/Widgets/search_bars.dart';
import '../../../Universal Reuseable Widgets/Widgets/text.dart';
import '../../../ViewModel/Body/Doctors/Profile/DoctorProfile/doctor_viewmodel.dart';
import 'Bottomsheet.dart';
import 'Profile/DoctorProfile/doctor_profile.dart';

class DoctorsHome extends StatelessWidget {
  const DoctorsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => DoctorsViewModel(),
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Search Bar
                    const SearchBars(
                      text: 'Search doctor...',
                      widget: ButtomSheet(),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Header3Text(
                          text: 'Sort by Category',
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => model.navigateToMoreCart(context),
                          child: const Text(
                            'see all...',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.h,
                        bottom: 10.h,
                      ),
                      child: SizedBox(
                        height: 50.h,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            GestureDetector(
                              onTap: () => model.changeCart('Physician'),
                              child: Category(
                                text: '👨🏽‍⚕️  Physician',
                                color: model.pageToView == 'Physician'
                                    ? Colors.blueGrey.shade50
                                    : Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => model.changeCart('Gynecologist'),
                              child: Category(
                                text: '🤰 Gynecologist',
                                color: model.pageToView == 'Gynecologist'
                                    ? Colors.blueGrey.shade50
                                    : Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => model.changeCart('Nutritionist'),
                              child: Category(
                                text: '🍔 Nutritionist',
                                color: model.pageToView == 'Nutritionist'
                                    ? Colors.blueGrey.shade50
                                    : Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => model.changeCart('Dermatologist'),
                              child: Category(
                                text: '💆🏻‍♀️ Dermatologist',
                                color: model.pageToView == 'Dermatologist'
                                    ? Colors.blueGrey.shade50
                                    : Colors.white,
                              ),
                            ),
                            // GestureDetector(
                            //   onTap: () => model.navigateToMoreCart(context),
                            //   child: const Category(
                            //     text: 'More...',
                            //     color: Colors.white,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    model.pageToView == 'Physician'
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.r),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: const RatedDoctors(
                                    name: 'Dr. Eze Santos',
                                    image: 'assets/images/Idris.jpg',
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const DoctorProfile();
                                        },
                                      ),
                                    );
                                  },
                                ),
                                const RatedDoctors(
                                  name: 'Dr. Uche Brown',
                                  image: 'assets/images/Idris.jpg',
                                ),
                                const RatedDoctors(
                                  name: 'Dr. Eze',
                                  image: 'assets/images/Idris.jpg',
                                ),
                                const RatedDoctors(
                                  name: 'Dr. Eze Santos',
                                  image: 'assets/images/Idris.jpg',
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),

                    model.pageToView == 'Gynecologist'
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.r),
                              ),
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: const RatedDoctors(
                                    name: 'Dr. Eze Santos',
                                    image: 'assets/images/Idris.jpg',
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const DoctorProfile();
                                        },
                                      ),
                                    );
                                  },
                                ),
                                const RatedDoctors(
                                  name: 'Dr. Uche Brown',
                                  image: 'assets/images/Idris.jpg',
                                ),
                                const RatedDoctors(
                                  name: 'Dr. Eze',
                                  image: 'assets/images/Idris.jpg',
                                ),
                                const RatedDoctors(
                                  name: 'Dr. Eze Santos',
                                  image: 'assets/images/Idris.jpg',
                                ),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),

                    model.pageToView == 'Nutritionist'
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.r),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: const RatedDoctors(
                                    name: 'Dr. Eze Santos',
                                    image: 'assets/images/Idris.jpg',
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const DoctorProfile();
                                        },
                                      ),
                                    );
                                  },
                                ),
                                const RatedDoctors(
                                  name: 'Dr. Uche Brown',
                                  image: 'assets/images/Idris.jpg',
                                ),
                                const RatedDoctors(
                                  name: 'Dr. Eze',
                                  image: 'assets/images/Idris.jpg',
                                ),
                                const RatedDoctors(
                                  name: 'Dr. Eze Santos',
                                  image: 'assets/images/Idris.jpg',
                                ),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),

                    model.pageToView == 'Dermatologist'
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.r),
                              ),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                GestureDetector(
                                  child: const RatedDoctors(
                                    name: 'Dr. Eze Santos',
                                    image: 'assets/images/Idris.jpg',
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const DoctorProfile();
                                        },
                                      ),
                                    );
                                  },
                                ),
                                const RatedDoctors(
                                  name: 'Dr. Uche Brown',
                                  image: 'assets/images/Idris.jpg',
                                ),
                                const RatedDoctors(
                                  name: 'Dr. Eze',
                                  image: 'assets/images/Idris.jpg',
                                ),
                                const RatedDoctors(
                                  name: 'Dr. Eze Santos',
                                  image: 'assets/images/Idris.jpg',
                                ),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
