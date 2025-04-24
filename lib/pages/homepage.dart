// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relief_fund/pages/chatbot.dart';
import 'package:relief_fund/pages/donation_req_form.dart';
import 'package:relief_fund/widgets/colors.dart';
import 'package:relief_fund/widgets/controller.dart';
import 'package:relief_fund/widgets/dots.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryColor,
                AppColors.secondaryColor,
              ], // Define your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Relief Aid',
          style: TextStyle(
            color: AppColors.backgroundColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.view_list_sharp, color: AppColors.backgroundColor),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),

                  //CarouselSlides
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: [
                          SlideImages(imageUrl: 'assets/images/s1.jpg'),
                          SlideImages(imageUrl: 'assets/images/s2.jpg'),
                        ],
                        options: CarouselOptions(
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          onPageChanged:
                              (index, _) => controller.updatePage(index),
                        ),
                      ),
                      SizedBox(height: 10),

                      //dots
                      Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < 2; i++)
                              Dots(
                                color:
                                    controller.carouselCurrentIndex.value == i
                                        ? AppColors.accentColor
                                        : Colors.grey,
                              ),
                            SizedBox(width: 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //buttons
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RequestForm(),
                            ),
                          );
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.75,
                            45,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Donate Now',
                          style: TextStyle(
                            color: AppColors.backgroundColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.secondaryColor,
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.75,
                            45,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Request for Donation',
                          style: TextStyle(
                            color: AppColors.backgroundColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //floating action button
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                top: 15,
                right: 30,
                bottom: 40,
              ),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatBot()),
                  );
                },
                backgroundColor: AppColors.accentColor,
                child: const Icon(
                  Icons.messenger_outline_rounded,
                  color: AppColors.backgroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//slide images

class SlideImages extends StatelessWidget {
  const SlideImages({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.fit = BoxFit.fill,
    this.padding,
    this.isnNetworkImage = false,
    this.onPressed,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isnNetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius:
              applyImageRadius ? BorderRadius.circular(20) : BorderRadius.zero,
          child: Image(
            fit: fit,
            image:
                isnNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
