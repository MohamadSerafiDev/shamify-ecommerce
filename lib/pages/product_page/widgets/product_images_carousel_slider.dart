import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:store/styles/constants.dart';

class ProductImagesCarouselSlider extends StatelessWidget {
  const ProductImagesCarouselSlider({
    super.key,
    required this.imgUrl,
  });
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: 200,
          height: 200,
          color: Theme.of(context).cardColor,
          child: Image.network('${Constants.localip}$imgUrl'),
        );
      },
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 2),
        autoPlayInterval: const Duration(seconds: 4),
        pauseAutoPlayOnTouch: true,
      ),
    );
  }
}
