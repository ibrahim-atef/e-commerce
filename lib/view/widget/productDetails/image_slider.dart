import 'package:badges/badges.dart' as badges;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:testgeo/logic/controlles/cart_controller.dart';
import 'package:testgeo/routes/routes.dart';
import 'package:testgeo/utils/theme.dart';

import 'color_picker.dart';

class ImageSlider extends StatefulWidget {
  ImageSlider({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController carouselController = CarouselController();
  int currenPage = 0;
  int currenColler = 0;
  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    notiSettings,mainColor
  ];
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return Container(
              margin: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.image)) // DecorationImage
                  ), // BoxDecoration
            ); // Container
          },
          options: CarouselOptions(
              onPageChanged: (index, reson) {
                setState(() {
                  currenPage = index;
                });
              },
              height: height*.54,
              autoPlay: true,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              autoPlayInterval: Duration(seconds: 2),
              viewportFraction: 1),
          itemCount: 3,
        ),
        Positioned(
            bottom: 37,
            child: AnimatedSmoothIndicator(
              count: 3,
              activeIndex: currenPage,
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: mmainColor,
              ),
            )),
        Positioned(
          right: 14,
          bottom: 15,
          child: Container(
            height: 200,
            width: 50,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        currenColler = index;
                      });
                    },
                    child: ColorPicker(
                      color: colorSelected[index],
                      outerBorder: currenColler == index,
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 3,
                  );
                },
                itemCount: colorSelected.length),
          ),
        ),
        Positioned(
          left: 5,
          top: 3,
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 12,
              right: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: mmainColor.withOpacity(.5),
                        shape: BoxShape.circle),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          right: 5,
          top: 3,
          child: Container(
            padding: EdgeInsets.only(
              top: 10,
              left: 12,
              right: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.cartScreen);
                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2,right: 2),
                      child:    Obx(() {
                        return badges.Badge(
                          position: badges.BadgePosition.topEnd(top: -10, end: -10),
                          // animationDuration: Duration(milliseconds: 300),
                          // animationType: badges.BadgeAnimationType.slide,
                          badgeContent: Text(
                            "${cartController.quantity().toString()}",
                            style: TextStyle(color: Colors.white),
                          ),
                          child: Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                        );
                      })
                      // Icon(
                      //   Icons.shopping_cart,
                      //   color: Colors.white,
                      // ),
                    ),
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: mmainColor.withOpacity(.5),
                        shape: BoxShape.circle),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
