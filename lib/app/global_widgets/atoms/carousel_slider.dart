import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../data/providers/external/api_provider.dart';
import '../../data/providers/external/src/api_provider_helper.dart';
import 'safe_image_network.dart';

class AtomCarouselSlider extends StatelessWidget {
  final List<String> images;
  final String? host;

  const AtomCarouselSlider({
    required this.images,
    this.host,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 120.0,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(
          milliseconds: 800,
        ),
      ),
      items: images.map((pathPicture) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: AtomSafeImageNetwork(
                host: host,
                path: pathPicture,
                headers: ApiProvider().getImageHeaders(),
                radius: 16,
                onTapShowFullScreen: true,
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
