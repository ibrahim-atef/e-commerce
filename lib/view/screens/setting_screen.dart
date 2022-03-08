import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/auth_controller.dart';
import 'package:testgeo/utils/theme.dart';
import 'package:testgeo/view/widget/setting/language_widget.dart';
import 'package:testgeo/view/widget/setting/logout_widget.dart';
import 'package:testgeo/view/widget/setting/profile_widget.dart';
import 'package:testgeo/view/widget/text_utils.dart';

class SettingScreen extends StatelessWidget {
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          ProfileImage(),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1.5,
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(
            height: 20,
          ),
            TextUtils(
              text: "GENERAL".tr,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: mmainColor,
              underLine: TextDecoration.none),
          SizedBox(height: 25,),
          LanguageWidget(),
          const SizedBox(
            height: 15,
          ),
          LogOutWidget(),
        ],
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Setting Screen"),
      //       GetBuilder<AuthController>(builder: (_) {
      //         return TextButton(
      //           onPressed: () {
      //             Get.defaultDialog(
      //                 title: "LogOut",
      //                 titleStyle: TextStyle(
      //                   fontSize: 18,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold,
      //                 ),
      //                 middleText: "Are you sure to logout??",
      //                 radius: 5,
      //                 textConfirm   : "No",
      //                 textCancel: "Yes",
      //                 onCancel: () {
      //                   controller.signOutFromApp();
      //
      //                 },
      //                 onConfirm: () { Get.back();
      //                 },
      //                 buttonColor: mainColor,
      //                 cancelTextColor: Colors.black,
      //                 confirmTextColor: Colors.white);
      //             // controller.signOutFromApp();
      //           },
      //           child: Text("Log out"),
      //         );
      //       })
      //     ],
      //   ),
      // ),
    );
  }
}
