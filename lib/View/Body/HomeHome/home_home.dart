import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import '../../../ViewModel/Body/HomeHome/home_home_viewmodel.dart';
import 'Pharmacy/pharmacy_view.dart';
import 'Services/doctor.dart';
import 'Services/drugs.dart';
import 'Services/others.dart';
import 'Services/services.dart';

class HomeHome extends StatefulWidget {
  const HomeHome({Key? key}) : super(key: key);

  @override
  State<HomeHome> createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      onViewModelReady: (m) => m.getName(),
      viewModelBuilder: () => HomeHomeViewModel(),
      builder: (context, m, child) {
        return SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Hello ',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 20.sp),
                    ),
                    Text(
                      '${m.firstName} 👋!',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),

                Text(
                  'Services',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.sp,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 100.h,
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //see a doctor
                      Services(
                        icons: Icons.person_rounded,
                        text: 'See a Doctor',
                        colors: Colors.blue.shade900,
                        boxColor: Colors.blue.shade100,
                        navigator: const SeeADoctor(),
                      ),
                      //order a drug
                      Services(
                        icons: Icons.medical_services,
                        text: 'Order for Drugs',
                        colors: Colors.orangeAccent,
                        boxColor: Colors.blue.shade100,
                        navigator: const OrderADrug(),
                      ),

                      //Dunno
                      Services(
                        icons: Icons.rate_review,
                        text: 'Dunno what this is',
                        colors: Colors.green,
                        boxColor: Colors.blue.shade100,
                        navigator: const Others(),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 30.h,
                ),

                //Emergency Tips
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 110.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                    decoration: BoxDecoration(
                      border:
                          Border.all(width: 1.w, color: Colors.green.shade900),
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(-2, 5),
                            blurRadius: 3,
                            color: Colors.grey),
                      ],
                      gradient: LinearGradient(
                        colors: [
                          Colors.green.shade800,
                          Colors.green.shade600,
                          Colors.green.shade400,
                        ],
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 210.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Emergency Tips',
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 25.sp,
                                    letterSpacing: 2,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Checkout helpful tips to solve domestic accidents and health care',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12.sp),
                              )
                            ],
                          ),
                        ),
                        // const Spacer(),
                        Image.asset('assets/images/ola.png'),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),

                //doctors
                Row(
                  children: [
                    Text(
                      'Top Rated Doctors',
                      style: TextStyle(
                        fontSize: 17.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'see more...',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 170.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      TopRatedDoctors(
                        name: 'Dr Druotola Rahmatallah',
                      ),
                      TopRatedDoctors(
                        name: 'Dr Wahaab Roqeebah',
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),
                // hospitals/pharmacists
                Row(
                  children: [
                    Text(
                      'Pharmacies Available',
                      style: TextStyle(
                        fontSize: 17.sp,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'see all...',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 300.h,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: m.pharmacyStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      }

                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      final pharmacyDetails = snapshot.data!.docs;

                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: pharmacyDetails.length,
                        itemBuilder: (context, index) {
                          final document = pharmacyDetails[index];
                          final fields =
                              document.data() as Map<String, dynamic>;

                          String pharmacyName = fields['pharmacyName'] ?? '';
                          final pharmacyLocation =
                              fields['pharmacyLocation'] ?? '';
                          final pharmacyAddress =
                              fields['pharmacyAddress'] ?? '';
                          final pharmacyProfileImage =
                              fields['pharmacyProfileImage'] ?? '';
                          final pharmacyProfileUID =
                              fields['pharmacyUID'] ?? '';

                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PharmacyView(
                                    pharmacyImage: pharmacyProfileImage,
                                    pharmacyName: pharmacyName,
                                    pharmacyUID: pharmacyProfileUID,
                                  ),
                                ),
                              );
                            },
                            child: PharmacyList(
                              image: pharmacyProfileImage,
                              name: pharmacyName,
                              location: pharmacyLocation,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          )),
        );
      },
    );
  }
}

class PharmacyList extends StatelessWidget {
  const PharmacyList({
    super.key,
    required this.image,
    required this.name,
    required this.location,
  });

  final String image;
  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 230.h,
        width: 200.w,
        decoration: BoxDecoration(
          color: Colors.blue.shade900,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            Container(
                height: 150.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(12.r),
                )),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 5.h,
                horizontal: 5.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    //textAlign: TextAlign.center,
                  ),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
