import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/auth_controller.dart';
import 'package:testgeo/logic/controlles/sitteng_controller.dart';
import 'package:testgeo/view/widget/text_utils.dart';

class ProfileImage extends StatelessWidget {
    ProfileImage({Key? key}) : super(key: key);
final controller = Get.find<SettingController>();
final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Obx((){return   Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(
                     authController.displayUserPhoto.value),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                  text: controller.capitalize(authController.displayUserName.value) ,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  underLine: TextDecoration.none),
                TextUtils(
                  text: authController.displayUserEmail.value ,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                  underLine: TextDecoration.none)
            ],
          )
        ],
      );})
      ],
    );
  }
}
