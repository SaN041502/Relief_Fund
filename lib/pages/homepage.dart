// ignore_for_file: file_names, use_build_context_synchronously

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:relief_fund/firebase/authentication.dart';
import 'package:relief_fund/pages/aboutus.dart';
import 'package:relief_fund/pages/chatbot.dart';
import 'package:relief_fund/pages/contact.dart';
import 'package:relief_fund/pages/donation_req_form.dart';
import 'package:relief_fund/pages/terms.dart';
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
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.backgroundColor),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primaryColor, AppColors.secondaryColor],
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
          icon: Icon(Icons.menu, color: Colors.white),
          onPressed: () => _openCustomDrawer(context),
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
                          SlideImages(imageUrl: 'assets/images/image1.jpg'),
                          SlideImages(imageUrl: 'assets/images/image2.jpg'),
                          SlideImages(imageUrl: 'assets/images/image3.jpg'),
                        ],
                        options: CarouselOptions(
                          viewportFraction: 1,
                          enableInfiniteScroll: true,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 2),
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
                            for (int i = 0; i < 3; i++)
                              Dots(
                                color:
                                    controller.carouselCurrentIndex.value == i
                                        ? AppColors.primaryColor
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
                          'Apply for Relief',
                          style: TextStyle(
                            color: AppColors.backgroundColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AuthenticationPage(),
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
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatBot()),
                  );
                },
                backgroundColor: AppColors.primaryColor,
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

//drawer
void _openCustomDrawer(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Align(
        alignment: Alignment.topLeft,
        child: Material(
          color: Colors.transparent,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(3, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap:
                        () => showDialog(
                          context: context,
                          builder: (context) => Contact(),
                        ),
                    child: Row(
                      children: [
                        Icon(Icons.contact_page, color: AppColors.textColor),
                        SizedBox(width: 20),
                        Text(
                          'Contact Us',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Divider(color: Colors.grey, thickness: 1),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap:
                        () => showDialog(
                          context: context,
                          builder: (context) => Aboutus(),
                        ),
                    child: Row(
                      children: [
                        Icon(Icons.info, color: AppColors.textColor),
                        SizedBox(width: 20),
                        Text(
                          'About Us',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  Divider(color: Colors.grey, thickness: 1),
                  SizedBox(height: 5),
                  GestureDetector(
                    onTap:
                        () => showDialog(
                          context: context,
                          builder: (context) => Terms(),
                        ),
                    child: Row(
                      children: [
                        Icon(Icons.description, color: AppColors.textColor),
                        SizedBox(width: 20),
                        Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}


