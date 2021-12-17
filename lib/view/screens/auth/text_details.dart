// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:udemy_shop_app/utils/theme.dart';
// import 'package:udemy_shop_app/view/widgets/productDetails/image_product.dart';

// class TextDetails extends StatelessWidget {
//   const TextDetails({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: mainColor,
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Get.back();
//           },
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         title: Text(
//           "eeeee",
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(left: 10, right: 10),
//           child: Column(
//             children: [
//               ImageProduct(),
//               const SizedBox(
//                 height: 30,
//               ),
//               // NamePriceProduct(
//               //   discountedPrice: product.discountedPrice,
//               //   price: product.price,
//               //   name: product.model,
//               //   quantity: product.quantity,
//               //   nameModel: product.categories[0].fullName,
//               //   discount: product.discount,
//               // ),
//               const SizedBox(
//                 height: 10,
//               ),
//               // ChnageCard(
//               //   description: product.descriptionStripped.isEmpty
//               //       ? "No Description Yet"
//               //       : product.descriptionStripped,
//               //   manufacturer: product.manufacturer == null
//               //       ? "No Manufacturer"
//               //       : product.manufacturer!.name,
//               //   price: product.discountedPrice,
//               //   sku: product.sku == null ? "No Sku" : product.sku,
//               // ),
//               const SizedBox(
//                 height: 40,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   InkWell(
//                     splashColor: Colors.pink,
//                     onTap: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                       height: 35,
//                       width: 170,
//                       decoration: BoxDecoration(
//                         color: mainColor,
//                         borderRadius: BorderRadius.circular(180),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             "assets/icons/cart.png",
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           const Text(
//                             "Add To Cart",
//                             style: TextStyle(
//                               fontSize: 16,
//                               color: Colors.black,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
