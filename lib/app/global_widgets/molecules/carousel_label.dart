// /*
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import '../../../app/core/values/colors.dart';
// import '../../core/extensions/string/not_null_and_not_empty.dart';
// import '../../core/theme/text.dart';
// import '../../data/models/entities/meal_picture.dart';
// import '../../data/providers/external/api_provider.dart';
// import '../../data/providers/external/src/api_provider_helper.dart';
// import '../../global_widgets/atoms/safe_image_network.dart';
//
// class MoleculeCarouselSliderWithLabel extends StatelessWidget {
//   final List<MealPicture> mealsPicture;
//   final String host;
//
//   const MoleculeCarouselSliderWithLabel({
//     required this.mealsPicture,
//     required this.host,
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         aspectRatio: 2.0,
//         enlargeCenterPage: true,
//         enableInfiniteScroll: false,
//         initialPage: 2,
//         autoPlay: true,
//       ),
//       items: mealsPicture.map((mealPicture) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Stack(
//               children: [
//                 Center(
//                   child: AtomSafeImageNetwork(
//                     host: host,
//                     path: mealPicture.pathPicture,
//                     headers: ApiProvider().getImageHeaders(),
//                     radius: 16,
//                     onTapShowFullScreen: true,
//                   ),
//                 ),
//                 if (mealPicture.description.isFilled)
//                   Positioned(
//                     bottom: 0.0,
//                     left: 0.0,
//                     right: 0.0,
//                     child: DecoratedBox(
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: [
//                             thirdColor,
//                             Color.fromARGB(0, 0, 0, 0)
//                           ],
//                           begin: Alignment.bottomCenter,
//                           end: Alignment.topCenter,
//                         ),
//                       ),
//                       child: CustomText.xl(
//                         mealPicture.description,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//               ],
//             );
//           },
//         );
//       }).toList(),
//     );
//   }
// }
// */
