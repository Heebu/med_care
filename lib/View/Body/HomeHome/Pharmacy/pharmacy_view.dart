import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../../ViewModel/Body/HomeHome/Pharmacy/pharmacy_viewmodel.dart';

class PharmacyView extends StatelessWidget {
  const PharmacyView({
    super.key,
    required this.pharmacyImage,
    required this.pharmacyName,
    required this.pharmacyUID,
  });

  final String pharmacyImage;
  final String pharmacyName;
  final String pharmacyUID;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => PharmacyViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          body: CustomScrollView(slivers: [
            SliverAppBar.large(
              leading: Row(children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.blue.shade900,
                    )),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.message,
                      color: Colors.blue.shade900,
                    ))
              ]),
              leadingWidth: MediaQuery.sizeOf(context).width,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  image: DecorationImage(
                      image: NetworkImage(pharmacyImage), fit: BoxFit.fill),
                ),
              ),
              expandedHeight: 250.h,
              collapsedHeight: 70.h,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(70.h),
                child: Container(
                  color: Colors.black.withOpacity(.4),
                  padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  child: Center(
                    child: Text(
                      pharmacyName,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20.sp),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () => model.onClicked('Drugs'),
                          child: PharmacyText(
                            text: 'Drugs',
                            color: model.clicked == 'Drugs'
                                ? Colors.blue.shade900
                                : Colors.blue,
                            size: model.clicked == 'Drugs' ? 25.sp : 20.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => model.onClicked('Doctors'),
                          child: PharmacyText(
                            text: 'Doctors',
                            color: model.clicked == 'Doctors'
                                ? Colors.blue.shade900
                                : Colors.blue,
                            size: model.clicked == 'Doctors' ? 25.sp : 20.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => model.onClicked('About'),
                          child: PharmacyText(
                            text: 'About',
                            color: model.clicked == 'About'
                                ? Colors.blue.shade900
                                : Colors.blue,
                            size: model.clicked == 'About' ? 25.sp : 20.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => model.onClicked('Reviews'),
                          child: PharmacyText(
                            text: 'Reviews',
                            color: model.clicked == 'Reviews'
                                ? Colors.blue.shade900
                                : Colors.blue,
                            size: model.clicked == 'Reviews' ? 25.sp : 20.sp,
                          ),
                        ),
                      ],
                    ),
                    model.clicked == 'Drugs'
                        ? Container(
                            height: MediaQuery.sizeOf(context).height,
                            color: Colors.green,
                          )
                        : SizedBox.shrink(),
                    model.clicked == 'Doctors'
                        ? Container(
                            height: MediaQuery.sizeOf(context).height,
                            color: Colors.pink,
                          )
                        : SizedBox.shrink(),
                    model.clicked == 'About'
                        ? Container(
                            height: MediaQuery.sizeOf(context).height,
                            color: Colors.purple,
                          )
                        : SizedBox.shrink(),
                    model.clicked == 'Reviews'
                        ? Container(
                            height: MediaQuery.sizeOf(context).height,
                            color: Colors.yellow,
                          )
                        : SizedBox.shrink(),
                  ],
                ),
              ),
            )
          ]),
        );
      },
    );
  }
}

class PharmacyText extends StatelessWidget {
  const PharmacyText({
    super.key,
    required this.text,
    required this.color,
    required this.size,
  });

  final String text;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
