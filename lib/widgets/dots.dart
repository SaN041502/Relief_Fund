import 'package:flutter/material.dart';

class Dots extends StatelessWidget {
  const Dots({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: 13,
      height: 13,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(400),
        color: color,
      ),
    );
  }
}
