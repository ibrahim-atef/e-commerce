import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:testgeo/logic/controlles/auth_controller.dart';
import 'package:testgeo/logic/controlles/cart_controller.dart';
import 'package:testgeo/logic/controlles/payment_controller.dart';

import 'package:testgeo/utils/theme.dart';

import '../text_utils.dart';

class PayMentMethodWidget extends StatefulWidget {
  const PayMentMethodWidget({Key? key}) : super(key: key);

  @override
  _PayMentMethodWidgetState createState() => _PayMentMethodWidgetState();
}

class _PayMentMethodWidgetState extends State<PayMentMethodWidget> {
  final payMentController = Get.find<PayMentController>();
  final cartController = Get.find<CartController>();
  final authController = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          // GetBuilder<PayMentController>(
          //   builder: (_) => buildRadioPayment(
          //     name: "Paypal",
          //     image: 'assets/images/paypal.png',
          //     scale: 0.7,
          //     value: 1,
          //     onChange: (int? value) {
          //       setState(() {
          //         radioPaymentIndex = value!;
          //       });
          //       payMentController.removeGooglePay();
          //     },
          //   ),
          // ),
          // const SizedBox(
          //   height: 15,
          // ),
          GetBuilder<PayMentController>(
            builder: (_) => buildRadioPayment(
              name: "ref Code",
              image: 'assets/images/machine.jpg',
              scale: 0.5,
              value: 1,
              onChange: (int? value) {
               payMentController.payWithRef();

              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GetBuilder<PayMentController>(
            builder: (_) => buildRadioPayment(
              name: "PayMob Card ",
              image: 'assets/images/credit.png',
              scale: 0.7,
              value: 2,
              onChange: (int? value) {
            payMentController.payWithCard();

              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,padding: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                scale: scale,
                height: 35,
              ),
              const SizedBox(
                width: 10,
              ),
              TextUtils(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                text: name,
                color: Colors.black,
                underLine: TextDecoration.none,
              ),
            ],
          ),
          Radio(
            value: value,
            groupValue: payMentController.radioPaymentIndex,
            fillColor: MaterialStateColor.resolveWith((states) => mainColor),
            onChanged: (int? value) {
              onChange(value);
            },
          ),
        ],
      ),
    );
  }
}
