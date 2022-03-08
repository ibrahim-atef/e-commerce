import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/auth_controller.dart';
import 'package:testgeo/view/widget/text_utils.dart';

class CheckWidget extends StatelessWidget {
 
final controller=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder:(_){
     return  Row(
       children: [
         InkWell(
           onTap: () {controller.checked();},
           child: Container(
             height: 17,
             width: 18,
             decoration: BoxDecoration(
               color: Colors.grey.shade300,
               borderRadius: BorderRadius.circular(10),
             ),
             child: SizedBox(height: 11,width: 11,
               child:controller.isChecked? Image.asset(
                 "assets/images/check.png",width: 11,height: 11,
                 color: Colors.red,
               ):Text(""),
             ),
           ),
         ),
         SizedBox(
           width: 10,
         ),
         TextUtils(
             text: "I accept ",
             fontSize: 16,
             fontWeight: FontWeight.normal,
             color: Colors.black87,
             underLine: TextDecoration.none),
         TextUtils(
             text: "terms & conditions",
             fontSize: 16,
             fontWeight: FontWeight.normal,
             color: Colors.black87,
             underLine: TextDecoration.underline),
       ],
     );
    } );
  }
}
