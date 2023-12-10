import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../ViewModel/Body/home_page_viewmodel.dart';
import 'ArticlePosts/posts_view.dart';
import 'Doctors/doctors_home.dart';
import 'HomeDrawer/home_drawer_view.dart';
import 'HomeHome/home_home.dart';
import 'ParmacyiesHome/pharmacy_view.dart';
import 'StoresHome/store_home.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomePageViewModel(),
        builder: (context, m, child) {
          return Scaffold(
            endDrawer: HomeDrawer(
              model: m,
            ),
            backgroundColor: Colors.grey.shade50,
            appBar: AppBar(
              title: Text(m.titleBar),
            ),
            body: PageView(
              controller: m.pageController,
              children: const [
                HomeHome(),
                DoctorsHome(),
                ShopStore(),
                PostView(),
                PharmacyHome(),
              ],
              onPageChanged: (index) {
                m.onChangePage(index);
              },
            ),
            bottomNavigationBar: BottomBar(
              selectedIndex: m.currentPage,
              onTap: (int index) {
                m.selectPage(index);
              },
              items: [
                //Home
                BottomBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text('Home'),
                  activeColor: Colors.blue.shade900,
                  inactiveColor: Colors.blueAccent,
                ),

                //Doctors
                BottomBarItem(
                  icon: const Icon(Icons.person_rounded),
                  title: const Text('Doctors'),
                  activeColor: Colors.blueGrey.shade900,
                  inactiveColor: Colors.blueGrey,
                ),

                //Pharmacy
                BottomBarItem(
                  icon: const Icon(Icons.medication),
                  title: const Text('Store'),
                  activeColor: Colors.green.shade900,
                  inactiveColor: Colors.green,
                ),

                //Blog
                BottomBarItem(
                  icon: const Icon(Icons.list_alt_rounded),
                  title: const Text('Articles'),
                  activeColor: Colors.purple.shade900,
                  inactiveColor: Colors.purpleAccent,
                ),

                //profile
                BottomBarItem(
                  icon: const Icon(Icons.local_hospital),
                  title: const Text('Pharmacies'),
                  activeColor: Colors.red.shade900,
                  inactiveColor: Colors.red,
                ),
              ],
            ),
          );
        });
  }
}
