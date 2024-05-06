import 'package:flutter/cupertino.dart';

import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';

class AgrimedCircularImage extends StatelessWidget {
  const AgrimedCircularImage({
    super.key,
    required this.image,
    this.width = 56,
    this.height = 56,
    this.backgroundColor,
    this.overlayColor,
    this.isNetworkImage = false,
    this.padding = AgrimedSize.sm,
    this.fit = BoxFit.cover,
  });

  final double width, height, padding;
  final Color? overlayColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
  final String image;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final darkMode = brightness == Brightness.dark;
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: darkMode ? AgrimedColors.black : AgrimedColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
