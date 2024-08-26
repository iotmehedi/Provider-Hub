import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgWidget extends StatelessWidget {
  final String image;
  final double height, width;
  const CustomSvgWidget({super.key, required this.image, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      image,
      width: width, // Specify width
      height: height, // Specify height
      fit: BoxFit.cover,
    );
  }
}
