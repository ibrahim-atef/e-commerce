import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/routes/routes.dart';
import 'package:testgeo/utils/theme.dart';
import 'package:testgeo/view/widget/auth/auth_button.dart';
import 'package:testgeo/view/widget/text_utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 85.0,
              left: 30.0,
              right: 30.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: width * .5,
                        height: width * .5,
                        child: Image.asset(
                          "assets/images/intro.png",
                          fit: BoxFit.cover,
                        )),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Your",
                            style: TextStyle(
                              color: Color(0xff3f3d56),
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "        Shop",
                            style: TextStyle(
                              color: Color(0xff3f3d56),
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Color(0xffFDF5EC),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: SingleChildScrollView(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WELCOME",
                        style: TextStyle(
                            fontSize: 37, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * .2,
                        child: Container(
                          alignment: Alignment.center,
                          height: height * .3,
                          decoration: BoxDecoration(
                              // image: DecorationImage(
                              //     image: AssetImage(
                              //         "assets/images/shopping-bag.png"),
                              //     fit: BoxFit.cover),
                              ),
                          child: Image.asset("assets/images/shopping-bag.png"),
                        ),
                      ),
                      SizedBox(
                        height: height * .16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AuthButton(
                            text: "Get Start",
                            onPressed: () {
                              // Get.offNamed(Routes.loginScreen);
                              Get.offNamed(Routes.loginScreen);
                            },
                            width: width * .7,
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: () {
                              Get.offNamed(Routes.signUpScreen);
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  fontSize: 14.5, fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                    ],
                  ),
                ],
              )),
            ),
          ),
        ],
      ),
    );
  }
}
