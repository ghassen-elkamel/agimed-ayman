import 'package:agimed/app/features/app_pages/screens/reclamation/widget/reclam_meta_data.dart';
import 'package:agimed/app/features/app_pages/screens/reclamation/widget/reclamation_image_detail.dart';
import 'package:flutter/material.dart';

class ReclamationDetail extends StatelessWidget {
  const ReclamationDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final dark = brightness == Brightness.dark;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // claim image
            ReclamationImageDetail(dark: dark),

            // claim detail
            const ReclamationMetaData(),
          ],
        ),
      ),
    );
  }
}
