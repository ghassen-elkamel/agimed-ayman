import 'package:flutter/material.dart';

import '../../../core/utils/constants/sizes.dart';

class AgrimedRoundedImage extends StatelessWidget {
  const AgrimedRoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.fit = BoxFit.contain,
    this.isNetworkImage = false,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius = AgrimedSize.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
              fit: fit,
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider),
        ),
      ),
    );
  }
}
