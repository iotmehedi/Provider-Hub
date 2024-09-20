import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCachedNetwork extends StatelessWidget {
  final String image;
  final double? height, weight;
  const CustomCachedNetwork({super.key, required this.image, this.height, this.weight});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      imageBuilder: (context, imageProvider) => Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: height ?? 50,
            width: weight ?? 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                  colorFilter:
                  ColorFilter.mode(Colors.transparent, BlendMode.colorBurn)),
            ),
          ),
        ),
      ),
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
