import 'package:flutter/material.dart';
import 'package:relief_fund/widgets/colors.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    super.key,
    required this.imagePath,
    required this.titles,
  });
  final String imagePath;
  final String titles;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            // ignore: deprecated_member_use
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titles,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.backgroundColor,
              ),
            ),
            Spacer(),
            Text(
              'Click to view more',
              style: TextStyle(fontSize: 14, color: AppColors.backgroundColor),
            ),
          ],
        ),
      ),
    );
  }
}
