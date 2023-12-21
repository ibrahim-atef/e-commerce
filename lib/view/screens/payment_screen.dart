import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:testgeo/logic/controlles/cart_controller.dart';
import 'package:testgeo/logic/controlles/payment_controller.dart';

import 'package:testgeo/utils/theme.dart';
import 'package:testgeo/view/screens/payment_screens/ref_code_screen.dart';
import 'package:testgeo/view/screens/payment_screens/visa_screen.dart';
import 'package:testgeo/view/widget/payment/delivery_continer_widget.dart';
import 'package:testgeo/view/widget/payment/payment_method_widget.dart';
import 'package:testgeo/view/widget/text_utils.dart';

import '../../logic/controlles/auth_controller.dart';

class PayMentScreen extends StatelessWidget {
  PayMentScreen({Key? key}) : super(key: key);

  final cartController = Get.find<CartController>();
  final paymentController = Get.find<PayMentController>();
  final authController = Get.find<AuthController>();

  String roundAndMultiplyBy100(String num) {
    try {
      double parsedNum = double.parse(num);
      int result = (parsedNum * 100).round();
      return result.toString();
    } catch (e) {
      // Handle the case where the input string is not a valid double
      print('Error: $e');
      return num; // return the original string as is
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("PayMent"),
        elevation: 0,
        backgroundColor: mmainColor,
        centerTitle: true,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtils(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  text: "Shipping to",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 20,
                ),
                const DeliveryContinerWidget(),
                const SizedBox(
                  height: 20,
                ),
                TextUtils(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  text: "Payment method",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  underLine: TextDecoration.none,
                ),
                const SizedBox(
                  height: 20,
                ),
                const PayMentMethodWidget(),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    text: "Total: ${cartController.total}\$",
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    underLine: TextDecoration.none,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 150,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        primary: Get.isDarkMode ? pinkClr : mainColor,
                      ),
                      onPressed: () {
                        paymentController.phoneNumber.value.isEmpty
                            ? Get.dialog(
                                AlertDialog(
                                  title: Text('Fill Phone Number'),
                                  content:
                                      Text('Please fill in your phone number.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Get.back(); // Close the dialog
                                      },
                                      child: Text('OK'),
                                    ),
                                  ],
                                ),
                              )
                            : paymentController.getAuthToken().then((value) {
                                /// here the function to get the the order id after getting authentication key
                                paymentController.radioPaymentIndex == 2
                                    ? paymentController
                                        .getOrderRegistrationID(
                                            price: roundAndMultiplyBy100(
                                                cartController.total),
                                            firstName: authController
                                                .displayUserName
                                                .toString(),
                                            lastName: "demo",
                                            email: authController
                                                .displayUserEmail
                                                .toString(),
                                            phone: paymentController
                                                .phoneNumber.value)
                                        .then((value) {
                                        /// here getting payment request to get the final token

                                        paymentController
                                            .getPaymentRequest(
                                              roundAndMultiplyBy100(
                                                  cartController.total),
                                              authController.displayUserName
                                                  .toString(),
                                              "demo",
                                              authController.displayUserEmail
                                                  .toString(),
                                              paymentController
                                                  .phoneNumber.value,
                                            )
                                            .then((value) => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          VisaScreen()),
                                                ));
                                      })
                                    : paymentController
                                        .getPaymentFinalKioskKey(
                                          roundAndMultiplyBy100(
                                              cartController.total),
                                          authController.displayUserName
                                              .toString(),
                                          "demo",
                                          authController.displayUserEmail
                                              .toString(),
                                          paymentController.phoneNumber.value,
                                        )
                                        .then((value) => paymentController
                                            .getRefCode()
                                            .then((value) => Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ReferenceScreen()),
                                                )));
                              }).catchError((onError) {
                                print(onError.toString());
                              });
                      },
                      child: paymentController.isLoading.value
                          ? LinearProgressIndicator(
                              color: Colors.red.shade300,
                            )
                          : Text(
                              "Pay Now",
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ),
                // GetBuilder<PayMentController>(
                //   builder: (_) {
                //     if (payMentController.paymentItems.isNotEmpty) {
                //       return Center(
                //         child: GooglePayButton(
                //           width: 200,
                //           height: 50,
                //           paymentConfigurationAsset: 'gpay.json',
                //           paymentItems: payMentController.paymentItems,
                //           style: GooglePayButtonStyle.black,
                //           type: GooglePayButtonType.pay,
                //           margin: const EdgeInsets.only(top: 15.0),
                //           onPaymentResult: (data) {
                //             print(data);
                //           },
                //           loadingIndicator: const Center(
                //             child: CircularProgressIndicator(),
                //           ),
                //         ),
                //       );
                //     } else {
                //       return Center(
                //         child: SizedBox(
                //           height: 50,
                //           width: 150,
                //           child: ElevatedButton(
                //             style: ElevatedButton.styleFrom(
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               elevation: 0,
                //               primary: Get.isDarkMode ? pinkClr : mainColor,
                //             ),
                //             onPressed: () {},
                //             child: const Text(
                //               "Pay Now",
                //               style: TextStyle(
                //                 fontSize: 22,
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ),
                //         ),
                //       );
                //     }
                //   },
                // ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
