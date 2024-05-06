import 'package:flutter/material.dart';

import '../../../../../common/widgets/common.widgets.image_text/vertical_image_text.dart';
import '../../../../../core/utils/constants/image_strings.dart';

class HomeDepartement extends StatelessWidget {
  const HomeDepartement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return VerticalImageText(
            image: AgrimedImages.programming, // Keep image constant
            title: 'IT',
            onTap: () {},
            // Adjust text color and background color based on the theme
            textColor: isDarkMode ? Colors.white : Colors.black,
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
          );
        },
      ),
    );
  }
}

/// hedha l code eli ken fih l image ma8ir mode dark
/*
import 'package:agrimed/common/widgets/common.widgets.image_text/vertical_image_text.dart';
import 'package:agrimed/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class HomeDepartement extends StatelessWidget {
  const HomeDepartement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return VerticalImageText(
            image: AgrimedImages.programming, // Keep image constant
            title: 'IT',
            onTap: () {},
            // Adjust text color and background color based on the theme
            textColor: isDarkMode ? Colors.white : Colors.black,
            backgroundColor: isDarkMode ? Colors.black : Colors.white,
          );
        },
      ),
    );
  }
}

 */
