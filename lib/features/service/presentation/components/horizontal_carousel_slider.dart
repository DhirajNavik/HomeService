import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:homeservice/core/helpers/common_helpers.dart';

class HorizontalCarouselSlider extends StatelessWidget {
  final List<String> images;

  const HorizontalCarouselSlider({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        return CommonHelpers.getCacheNetworkImage(images[index]);
      },
      options: CarouselOptions(
        viewportFraction: 1,
        aspectRatio: 2,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        enlargeCenterPage: false,
        enableInfiniteScroll: true,
      ),
    );
  }
}
