// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:testgeo/view/widget/text_utils.dart';
//
// class DeliveryContainerWidget extends StatefulWidget {
//   const DeliveryContainerWidget({Key? key}) : super(key: key);
//
//   @override
//   State<DeliveryContainerWidget> createState() =>
//       _DeliveryContainerWidgetState();
// }
//
// class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
//   int radioContainerIndex = 1;
//   bool changeColor=false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         buildRadioContainer(
//             title: 'Atef',
//             phone: '01126754631',
//             address: 'Sharqia-zag',
//             value: 1,
//             onChande: (int value){
//               setState(() {
//                 radioContainerIndex=value;
//                 changeColor=!changeColor;
//               });
//             },
//             color: changeColor? Colors.white:Colors.grey.shade300),
//         SizedBox(height: 10,),
//         buildRadioContainer(
//             title: 'levi',
//             phone: '0112676541',
//             address: 'Sharqia-zag',
//             value: 2,
//             onChande: (int value){
//               setState(() {
//                 radioContainerIndex=value;
//                 changeColor=!changeColor;
//               });
//             },
//             color: changeColor? Colors.grey.shade300:Colors.white),
//
//       ],
//     );
//   }
//
//   Widget buildRadioContainer({
//     required Color color,
//     required int value,
//     required Function onChande,
//     required String title,
//     required String phone,
//     required String address,
//   }) {
//     return Container(
//       height: 120,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: color,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             spreadRadius: 2,
//             blurRadius: 6,
//             offset: Offset(0, 3), // changes position of shadow
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Column(mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Radio(
//                 value: value,
//                 groupValue: radioContainerIndex,
//                 onChanged: (int? value) {
//                   onChande(value);
//                 },
//                 fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
//               ),
//             ],
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextUtils(
//                     text: title,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                     underLine: TextDecoration.none),
//                 const SizedBox(
//                   height: 5,
//                 ),
//                 TextUtils(
//                     text: phone,
//                     fontSize: 15,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.black,
//                     underLine: TextDecoration.none),
//                 SizedBox(
//                   height: 5,
//                 ),
//                 TextUtils(
//                     text: address,
//                     fontSize: 15,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.black,
//                     underLine: TextDecoration.none),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
