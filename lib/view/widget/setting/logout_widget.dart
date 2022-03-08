import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/auth_controller.dart';
import 'package:testgeo/utils/theme.dart';

import '../text_utils.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildIconWidget(),
      ],
    );
  }

  Widget buildIconWidget() {
    return GetBuilder<AuthController>(builder: (_) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
                title: "Logout".tr,
                titleStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                middleText: "Are you sure to logout??",
                radius: 5,
                textConfirm: "No",
                textCancel: "Yes",
                onCancel: () {
                  controller.signOutFromApp();
                },
                onConfirm: () {
                  Get.back();
                },
                buttonColor: mainColor,
                cancelTextColor: Colors.black,
                confirmTextColor: Colors.white);
          },
          splashColor: mmainColor.withOpacity(.3),
          borderRadius: BorderRadius.circular(12),
          customBorder: StadiumBorder(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: notiSettings,
                  ),
                  child: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextUtils(
                    text: "Logout".tr,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    underLine: TextDecoration.none)
              ],
            ),
          ),
        ),
      );
    });
  }
}
