import 'package:flutter/material.dart';
import 'package:testgeo/utils/theme.dart';
import 'package:testgeo/view/widget/home/card_items.dart';
import 'package:testgeo/view/widget/home/search_text_form.dart';
import 'package:testgeo/view/widget/text_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
                width: double.infinity,
                height: height * .23,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: mmainColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextUtils(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          text: "Find Your",
                          color: Colors.white,
                          underLine: TextDecoration.none,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        TextUtils(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          text: "INSPIRATION",
                          color: Colors.white,
                          underLine: TextDecoration.none,
                        ),
                        SizedBox(
                          height: height*.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: SearchTextFormField(),
                        )
                      ]),
                ) // Column
                ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                  text: "Categories",
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  underLine: TextDecoration.none,
                ),
              ),
            ),SizedBox(height:30 ,),
            CardItems()
          ],
        ),
      ),
    );
  }
}
