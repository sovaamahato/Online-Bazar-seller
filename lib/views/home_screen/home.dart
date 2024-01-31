import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_bazar_seller/const/const.dart';
import 'package:online_bazar_seller/controller/home_controller.dart';
import 'package:online_bazar_seller/views/home_screen/home_screen.dart';
import 'package:online_bazar_seller/views/order_screen/order_screen.dart';
import 'package:online_bazar_seller/views/products_screen/product_screen.dart';
import 'package:online_bazar_seller/views/profile_screen/profile_screen.dart';
import 'package:online_bazar_seller/views/widgets/text_style.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    //4 ota screens------------------
    var navScreens = [
      HomeScreen(),
      ProductScreen(),
      OrderScreen(),
      ProfileScreen(),
    ];

    //for bottom nav bar-----------------
    var bottomNavbar = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Dashboard"),
      BottomNavigationBarItem(
          icon: Image.asset(icProducts, color: darkGrey, width: 24),
          label: "products"),
      BottomNavigationBarItem(
          icon: Image.asset(icOrders, color: darkGrey, width: 24),
          label: "orders"),
      BottomNavigationBarItem(
          icon: Image.asset(icGeneralSettings, color: darkGrey, width: 24),
          label: "settings"),
    ];
    return Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   title: boldtext(text: "DashBorad", color: fontGrey, size: 18.0),
      // ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (index) {
            controller.navIndex.value = index;
          },
          currentIndex: controller.navIndex.value,
          type: BottomNavigationBarType.fixed,
          items: bottomNavbar,
          selectedItemColor: purpleColor,
          unselectedItemColor: darkGrey,
        ),
      ),
      body: Obx(
        () => Column(children: [
          Expanded(child: navScreens.elementAt(controller.navIndex.value))
        ]),
      ),
    );
  }
}
