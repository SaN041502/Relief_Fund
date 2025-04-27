// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, prefer_final_fields, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:relief_fund/pages/homepage.dart';
import 'package:relief_fund/widgets/colors.dart';
import 'package:relief_fund/widgets/slides.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlidePages extends StatefulWidget {
  const SlidePages({super.key});

  @override
  State<SlidePages> createState() => _SlidePagesState();
}

class _SlidePagesState extends State<SlidePages> {
  static final PageController _pageController = PageController(initialPage: 0);

  List<Widget> _Slides = [
    Slides(
      image: "assets/images/slide1.jpg",
      title: 'Helping Hands for the Needy',
      description:
          "ReliefAid connects donors and victims affected by natural disasters, providing fast and transparent help.",
      buttonText: 'next',
      onPressed: () {
        _pageController.animateToPage(
          1,
          duration: Durations.long1,
          curve: Curves.linearToEaseOut,
        );
      },
    ),
    Slides(
      image: "assets/images/slide2.jpg",
      title: 'Transparent Donations',
      description:
          "Give with confidence — we guarantee your help gets to those in need.",
      buttonText: 'next',
      onPressed: () {
        _pageController.animateToPage(
          2,
          duration: Durations.long1,
          curve: Curves.linearToEaseOut,
        );
      },
    ),
    Builder(
      builder: (context) {
        return Slides(
          image: "assets/images/slide3.jpg",
          title: "Apply for Relief, Anytime",
          description:
              "Victims can easily apply for help by submitting a simple form with documents and details.",
          buttonText: 'done',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const Homepage()),
            );
          },
        );
      },
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(controller: _pageController, children: _Slides),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: _Slides.length,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.accentColor,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: Durations.long1,
                  curve: Curves.linearToEaseOut,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
