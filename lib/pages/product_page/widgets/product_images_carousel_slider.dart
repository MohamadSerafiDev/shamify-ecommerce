import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductImagesCarouselSlider extends StatelessWidget {
  const ProductImagesCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 5,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: 200,
          height: 200,
          color: Theme.of(context).cardColor,
          child: Image.asset(
            'assets/images/no-image-icon.jpg',
          ),
        );
      },
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(seconds: 2),
        autoPlayInterval: const Duration(seconds: 4),
        enlargeFactor: 0.6,
        viewportFraction: 0.6,
        pauseAutoPlayOnTouch: true,
      ),
    );
  }
}
