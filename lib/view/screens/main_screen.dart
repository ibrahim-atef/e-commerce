import 'package:badges/badges.dart'as badges;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/cart_controller.dart';
import 'package:testgeo/logic/controlles/main_controller.dart';
import 'package:testgeo/routes/routes.dart';
import 'package:testgeo/utils/theme.dart';

class MainScreen extends StatelessWidget {
  final controller = Get.find<MainController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Text(""),
          elevation: 0,
          backgroundColor: mmainColor,
          title: Text(
            controller.titles[controller.currentIndex.value],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Obx(() {
              return badges.Badge(
                position: badges.BadgePosition.topEnd(top: 0, end: 3),
                // animationDuration: Duration(milliseconds: 300),
                // animationType: badges.BadgeAnimationType.slide,
                badgeContent: Text(
                  "${cartController.quantity().toString()}",
                  style: TextStyle(color: Colors.white),
                ),
                child: IconButton(
                  onPressed: () {
                    Get.toNamed(Routes.cartScreen);
                  },
                  icon: Image.asset("assets/images/shop.png"),
                ),
              );
            })
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          backgroundColor: Colors.white,
          currentIndex: controller.currentIndex.value,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black45,
                ),
                label: "",
                activeIcon: Icon(
                  Icons.home,
                  color: mmainColor,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.category,
                  color: Colors.black45,
                ),
                label: "",
                activeIcon: Icon(
                  Icons.category,
                  color: mmainColor,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black45,
                ),
                label: "",
                activeIcon: Icon(
                  Icons.favorite,
                  color: mmainColor,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.black45,
                ),
                label: "",
                activeIcon: Icon(
                  Icons.settings,
                  color: mmainColor,
                )),
          ],
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: controller.tabs.value,
        ),
      );
    }));
  }
}
