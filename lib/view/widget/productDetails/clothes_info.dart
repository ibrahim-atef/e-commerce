import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:testgeo/logic/controlles/product_controller.dart';
import 'package:testgeo/utils/theme.dart';
import 'package:testgeo/view/widget/text_utils.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int id;
  final double rate;
  final String desc;

  ClothesInfo({
    Key? key,
    required this.title,
    required this.id,
    required this.rate,
    required this.desc,
  }) : super(key: key);
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Obx(() {
                return Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.manageFavorite(id);
                    },
                    child: Icon(
                      controller.isFavorite(id)
                          ? Icons.favorite
                          : Icons.favorite_outline_rounded,
                      size: 20,
                      color: Colors.red,
                    ),
                  ),
                );
              })
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: "$rate",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                underLine: TextDecoration.none,
              ),
              SizedBox(width: 10,),
              RatingBar.builder(
                initialRating: rate,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 20,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )
            ],
          ),
          SizedBox(height: 20),
          ReadMoreText(desc,
              trimLines: 4,
            trimMode: TrimMode.Line,

            textAlign: TextAlign.justify,
              trimCollapsedText: " Show More",
              trimExpandedText: " Show Less",
              lessStyle: TextStyle(
                fontWeight: FontWeight.w900,
                color: mainColor,
              ),
              // TextStyle
              moreStyle: TextStyle(
                fontWeight: FontWeight.w900,
                color: mainColor,
              ),
              // TextStyle
              style: TextStyle(fontSize: 16,height: 2,
                fontWeight: FontWeight.w700,
                color: mmainColor,
                // TextStyle
              ),)
        ],
      ),
    );
  }
}
