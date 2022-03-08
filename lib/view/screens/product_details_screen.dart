import 'package:flutter/material.dart';
import 'package:testgeo/model/product_model.dart';
import 'package:testgeo/view/widget/productDetails/add_cart.dart';
import 'package:testgeo/view/widget/productDetails/clothes_info.dart';
import 'package:testgeo/view/widget/productDetails/image_slider.dart';
import 'package:testgeo/view/widget/productDetails/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;

  ProductDetailsScreen({Key? key, required this.productModels})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(
                image: productModels.image,
              ),
              ClothesInfo(
                title: productModels.title,
                id: productModels.id,
                rate: productModels.rating.rate,
                desc: productModels.description,
              ),
              SizeList(),
              AddCart(
                price: productModels.price, productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
