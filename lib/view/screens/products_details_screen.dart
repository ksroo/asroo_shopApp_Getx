import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_shop_app/models/product_models.dart';
import 'package:udemy_shop_app/utils/theme.dart';

import 'package:udemy_shop_app/view/widgets/productDetails/add_cart.dart';

import 'package:udemy_shop_app/view/widgets/productDetails/image_sliders.dart';

import 'package:udemy_shop_app/view/widgets/productDetails/clothes_info.dart';
import 'package:udemy_shop_app/view/widgets/productDetails/size_list.dart';

class ProductsDetailsScreen extends StatelessWidget {
  final ProductModels productModel;
  const ProductsDetailsScreen({
    required this.productModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSliders(
                imgeUrl: productModel.image,
              ),
              ClothesInfo(
                description: productModel.description,
                rate: productModel.rating.rate,
                title: productModel.title,
                productId: productModel.id,
              ),
              const SizeList(),
              AddCart(
                price: productModel.price,
                productModels: productModel,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
