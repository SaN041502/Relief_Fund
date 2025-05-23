import 'package:flutter/material.dart';
import 'package:relief_fund/widgets/colors.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.backgroundColor,
      alignment: Alignment.center,
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Email:',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 5),
                Text('support@relieffund.app'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Phone:',style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),),
                SizedBox(width: 5),
                Text('+123 456 7890'),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Address:',style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),),
                SizedBox(width: 5),
                Text('123, Flutter Street, App City'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
