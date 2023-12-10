import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../Universal Reuseable Widgets/Widgets/search_bars.dart';
import '../../../Universal Reuseable Widgets/Widgets/text.dart';
import '../HomeHome/Services/others.dart';
import '../StoresHome/Categories/anti_malaria.dart';
import '../StoresHome/Categories/antibiotics.dart';
import '../StoresHome/Categories/blood_pressure.dart';
import '../StoresHome/Categories/immune_system.dart';
import '../StoresHome/Categories/nurero_pill.dart';
import '../StoresHome/Categories/pain_killer.dart';
import '../StoresHome/Categories/pancreatics.dart';
import '../StoresHome/Categories/stomach.dart';
import 'bottom_sheet.dart';
import 'selected_category.dart';

class ShopStore extends StatefulWidget {
  const ShopStore({Key? key}) : super(key: key);

  @override
  State<ShopStore> createState() => _ShopStoreState();
}

class _ShopStoreState extends State<ShopStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 10.h,
                horizontal: 10.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchBars(
                    text: 'Search Drug Supplements',
                    widget: BottomSheetPH(),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Header3Text(text: 'Drug Categories'),
                      Spacer(),
                      GestureDetector(
                        onTap: () {},
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
                ],
              ),
            ),
            SizedBox(
              height: 450.h,
              child: GridView.count(crossAxisCount: 3, children: const [
                SelectCategory(
                  navigation: AntiMalaria(),
                  text: 'Anti-Malaria',
                  image: 'assets/images/drugs/anti malaria.jpg',
                ),
                SelectCategory(
                  navigation: Antibiotics(),
                  text: 'AntiBiotics',
                  image: 'assets/images/drugs/antibiotics.jpg',
                ),
                SelectCategory(
                  navigation: PainKiller(),
                  text: 'Pain Killers',
                  image: 'assets/images/drugs/pain killers.jpg',
                ),
                SelectCategory(
                  navigation: BloodPressure(),
                  text: 'Blood Pressure',
                  image: 'assets/images/drugs/blood pressure.png',
                ),
                SelectCategory(
                  navigation: ImmuneSystem(),
                  text: 'Drops',
                  image: 'assets/images/drugs/eye drops.png',
                ),

                SelectCategory(
                  navigation: Pancreatics(),
                  text: 'Pancreatics',
                  image: 'assets/images/drugs/pancreatics.jpg',
                ),
                SelectCategory(
                  navigation: NueroPill(),
                  text: 'Nuero Pill',
                  image: 'assets/images/drugs/nureo pillls.jpg',
                ),
                // SelectCategory(
                //   navigation: ImmuneSystem(),
                //   text: 'ImmuneSystem',
                //   image: 'assets/images/drugs/immune system.jpg',
                // ),

                SelectCategory(
                  navigation: Stomach(),
                  text: 'Med Equipments',
                  image: 'assets/images/drugs/stomach pain.jpg',
                ),
                SelectCategory(
                  navigation: Others(),
                  text: 'Others',
                  image: 'assets/images/drugs/other pills.jpg',
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
