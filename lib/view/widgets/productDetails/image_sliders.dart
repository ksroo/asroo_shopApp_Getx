import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_shop_app/logic/controllers/cart_controller.dart';
import 'package:udemy_shop_app/routes/routes.dart';
import 'package:udemy_shop_app/utils/theme.dart';
import 'package:udemy_shop_app/view/widgets/productDetails/colors_picker.dart';

class ImageSliders extends StatefulWidget {
  final String imgeUrl;
  const ImageSliders({
    required this.imgeUrl,
    Key? key,
  }) : super(key: key);

  @override
  _ImageSlidersState createState() => _ImageSlidersState();
}

class _ImageSlidersState extends State<ImageSliders> {
  final List<Color> colorsSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
    kCOlor4,
    kCOlor5,
    kCOlor3,
    kCOlor4,
    kCOlor5,
  ];
  final CarouselController carouselController = CarouselController();
  int currentPage = 0;
  int currentColor = 0;

  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options: CarouselOptions(
            height: 500,
            autoPlay: true,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            autoPlayInterval: const Duration(seconds: 2),
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                setState(() => currentPage = index),
          ),
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.imgeUrl),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
            );
          },
        ),
        Positioned(
          bottom: 30,
          left: 180,
          child: AnimatedSmoothIndicator(
            activeIndex: currentPage,
            count: 3,
            effect: ExpandingDotsEffect(
              dotWidth: 10,
              dotHeight: 10,
              activeDotColor: Get.isDarkMode ? pinkClr : mainColor,
              dotColor: Colors.black,
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 200,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return GestureDetector(
                onTap: () {
                  setState(() {
                    currentColor = index;
                  });
                },
                child: ColorsPicker(
                  outerBorder: currentColor == index,
                  color: colorsSelected[index],
                ),
              );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 3,
              ),
              itemCount: colorsSelected.length,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(
            top: 20,
            left: 25,
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
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? pinkClr.withOpacity(0.8)
                        : mainColor.withOpacity(0.8),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              Obx(
                () => Badge(
                  position: BadgePosition.topEnd(
                    top: -10,
                    end: -12,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  animationType: BadgeAnimationType.slide,
                  badgeContent: Text(
                    cartController.quantity().toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.cartScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Get.isDarkMode
                            ? pinkClr.withOpacity(0.8)
                            : mainColor.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
              // InkWell(
              //   onTap: () {
              //     Get.toNamed(Routes.cartScreen);
              //   },
              //   child: Container(
              //     padding: const EdgeInsets.all(8),
              //     decoration: BoxDecoration(
              //       color: Get.isDarkMode
              //           ? pinkClr.withOpacity(0.8)
              //           : mainColor.withOpacity(0.8),
              //       shape: BoxShape.circle,
              //     ),
              //     child: Icon(
              //       Icons.shopping_cart,
              //       color: Get.isDarkMode ? Colors.black : Colors.white,
              //       size: 20,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
