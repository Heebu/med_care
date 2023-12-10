import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../Universal Reuseable Widgets/Widgets/search_bars.dart';
import '../../../Universal Reuseable Widgets/Widgets/text.dart';
import '../Doctors/Bottomsheet.dart';
import '../Doctors/reuseables.dart';
import '../HomeHome/Pharmacy/pharmacy_view.dart';
import '../HomeHome/Pharmacy/pharmacy_viewmodel.dart';

class PharmacyHome extends StatelessWidget {
  const PharmacyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PharmacyViewModel(),
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
                      text: 'Search Health Centers...',
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
                              onTap: () => model.changeCart('Clinics'),
                              child: Category(
                                text: 'Clinics',
                                color: model.pageToView == 'Clinics'
                                    ? Colors.blueGrey.shade50
                                    : Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => model.changeCart('Pharmacies'),
                              child: Category(
                                text: 'Pharmacies',
                                color: model.pageToView == 'Pharmacies'
                                    ? Colors.blueGrey.shade50
                                    : Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => model.changeCart('Hospitals'),
                              child: Category(
                                text: 'Hospitals',
                                color: model.pageToView == 'Hospitals'
                                    ? Colors.blueGrey.shade50
                                    : Colors.white,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => model.changeCart('Physciateric'),
                              child: Category(
                                text: 'Physciateric',
                                color: model.pageToView == 'Physciateric'
                                    ? Colors.blueGrey.shade50
                                    : Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    model.pageToView == 'Clinics'
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
                                  child: const PharmacyCards(
                                    name: 'Alhmdulillah Medical Center',
                                    image: 'assets/images/Idris.jpg',
                                    location: 'Ibadan',
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const PharmacyView(
                                            pharmacyImage: '',
                                            pharmacyName: 'Idris',
                                            pharmacyUID: 'pharmacyProfileUID',
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                                const PharmacyCards(
                                  name: 'Alhmdulillah Medical Center',
                                  image: 'assets/images/Idris.jpg',
                                  location: 'Ibadan',
                                ),
                                const PharmacyCards(
                                  name: 'Alhmdulillah Medical Center',
                                  image: 'assets/images/Idris.jpg',
                                  location: 'Ibadan',
                                ),
                                const PharmacyCards(
                                  name: 'Alhmdulillah Medical Center',
                                  image: 'assets/images/Idris.jpg',
                                  location: 'Ibadan',
                                ),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),

                    model.pageToView == 'Pharmacies'
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
                                  child: const PharmacyCards(
                                    name: 'Alhmdulillah Medical Center',
                                    image: 'assets/images/Idris.jpg',
                                    location: 'Ibadan',
                                  ),
                                  onTap: () {},
                                ),
                                const PharmacyCards(
                                  name: 'Alhmdulillah Medical Center',
                                  image: 'assets/images/Idris.jpg',
                                  location: 'Ibadan',
                                ),
                                const PharmacyCards(
                                  name: 'Alhmdulillah Medical Center',
                                  image: 'assets/images/Idris.jpg',
                                  location: 'Ibadan',
                                ),
                                const PharmacyCards(
                                  name: 'Alhmdulillah Medical Center',
                                  image: 'assets/images/Idris.jpg',
                                  location: 'Ibadan',
                                ),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),

                    model.pageToView == 'Hospitals'
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
                                  child: const PharmacyCards(
                                    name: 'Alhmdulillah Medical Center',
                                    image: 'assets/images/Idris.jpg',
                                    location: 'Ibadan',
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return const PharmacyView(
                                            pharmacyImage: '',
                                            pharmacyName: 'Idris',
                                            pharmacyUID: 'pharmacyProfileUID',
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                                const PharmacyCards(
                                  name: 'Alhmdulillah Medical Center',
                                  image: 'assets/images/Idris.jpg',
                                  location: 'Ibadan',
                                ),
                                const PharmacyCards(
                                  name: 'Alhmdulillah Medical Center',
                                  image: 'assets/images/Idris.jpg',
                                  location: 'Ibadan',
                                ),
                                const PharmacyCards(
                                  name: 'Alhmdulillah Medical Center',
                                  image: 'assets/images/Idris.jpg',
                                  location: 'Ibadan',
                                ),
                              ],
                            ),
                          )
                        : SizedBox.shrink(),

                    model.pageToView == 'Physciateric'
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
                                  onTap: () {},
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
