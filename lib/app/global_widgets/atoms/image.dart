import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class AtomImage extends StatelessWidget {
  final String path;
  final int memCacheHeight;
  final int memCacheWidth;
  final double width;
  final double height;

  const AtomImage({
    Key? key,
    required this.path,
    this.memCacheHeight = 50,
    this.memCacheWidth = 50,
    this.width = 40,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (path.contains("assets")) {
      return Image.asset(path);
    }
    return CachedNetworkImage(
      imageUrl: path,
      fit: BoxFit.cover,
      width: width,
      memCacheHeight: memCacheHeight,
      memCacheWidth: memCacheWidth,
      height: height,
    );
  }
}
