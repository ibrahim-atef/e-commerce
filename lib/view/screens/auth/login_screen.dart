import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/auth_controller.dart';
import 'package:testgeo/routes/routes.dart';
import 'package:testgeo/utils/my_string.dart';
import 'package:testgeo/view/widget/auth/auth_button.dart';
import 'package:testgeo/view/widget/auth/auth_text_form.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final controller = Get.find<AuthController>();

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
                            "Shop",
                            style: TextStyle(
                              color: Color(0xff3f3d56),
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            "        App",
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
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LOGIN",
                        style: TextStyle(
                            fontSize: 29, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: height * .03,
                          ),
                          AuthTextFormField(
                              controller: emailController,
                              obscureText: false,
                              validator: (value) {
                                if (!RegExp(validationEmail).hasMatch(value)) {
                                  return "Invalid Email";
                                } else {
                                  return null;
                                }
                              },
                              prefixIcon: Image.asset(
                                "assets/images/email.png",
                                color: Color(0xffcc6213),
                              ),
                              suffixIcon: Text(""),
                              hintText: "Email"),
                          SizedBox(
                            height: height * .01,
                          ),
                          GetBuilder<AuthController>(
                            builder: (_) {
                              return AuthTextFormField(
                                  controller: passController,
                                  obscureText:
                                      controller.isVisibilty ? false : true,
                                  validator: (value) {
                                    if (value.toString().length < 6) {
                                      return "Password should be longer or equal to 6 characters";
                                    } else {
                                      return null;
                                    }
                                  },
                                  prefixIcon: Image.asset(
                                    "assets/images/lock.png",
                                    color: Color(0xffcc6213),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      controller.visibility();
                                    },
                                    icon: controller.isVisibilty
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility),
                                    color: Color(0xffcc6213),
                                  ),
                                  hintText: "Password");
                            },
                          ),
                          SizedBox(
                            height: height * .008,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.forgetPass);
                                },
                                child: Text(
                                  "Forgot password?",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * .1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GetBuilder<AuthController>(builder: (_) {
                                return AuthButton(
                                    text: "LogIn",
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        String email =
                                            emailController.text.trim();
                                        String password = passController.text;
                                        controller.loginUsingFirebase(
                                            email: email, password: password);
                                      }
                                    },
                                    width: width * .7);
                              })
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
                                  Get.toNamed(Routes.signUpScreen);
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 14.5,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                color: Colors.black54,
                                endIndent: 5,
                                thickness: .5,
                              )),
                              Text(
                                "Or continue with",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w700),
                              ),
                              Expanded(
                                  child: Divider(
                                color: Colors.black54,
                                indent: 5,
                                thickness: .5,
                              )),
                            ],
                          ),
                          SizedBox(
                            height: height * .03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: () {
                                    controller.facebookSignupApp();
                                  },
                                  child: Container(
                                    width: width * .076,
                                    height: width * .076,
                                    child: Image.asset(
                                      "assets/images/facebook.png",
                                    ),
                                  )),
                              SizedBox(
                                width: width * .05,
                              ),

                            ],
                          )
                        ],
                      ),
                    ),
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
