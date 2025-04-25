import 'package:flutter/material.dart';
import 'package:relief_fund/widgets/colors.dart';

class Textfield extends StatelessWidget {
  const Textfield({super.key, required this.text1, required this.text2, this.controller});

  final String text1;
  final String text2;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.secondaryColor,
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: TextFormField(
            
            // ignore: body_might_complete_normally_nullable
            validator: (value) {
              if (value!.trim().isEmpty) {
                return 'This field is required!';
              }
            },

            decoration: InputDecoration(
              filled: true,
              fillColor: const Color.fromARGB(50, 255, 168, 38),
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              hintText: text2,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
