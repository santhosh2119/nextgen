
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  ImageSlider({Key? key}) : super(key: key);
  final List sliderDetailsList = [
    "assets/images/slider1.png",
    "assets/images/slider2.jpg",
    "assets/images/slider3.jpg",
    "assets/images/slider4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 175,
        width: double.infinity,
        child: CarouselSlider.builder(
          itemCount: sliderDetailsList.length,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: false,
            viewportFraction: 0.9,
            aspectRatio: 2.0,
            initialPage: 1,
          ),
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) => Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 6),
                width: double.infinity,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(sliderDetailsList[itemIndex])),
              ),
            ],
          ),
        ));
  }
}
