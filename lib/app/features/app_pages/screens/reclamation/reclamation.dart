import 'package:agimed/app/features/app_pages/screens/reclamation/widget/categorie_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products.cart/cart/cart_menu_icon.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../all_dep/all_dep.dart';
import 'dep_card.dart';

class ReclamationScreen extends StatelessWidget {
  const ReclamationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.platformBrightnessOf(context);
    final darkMode = brightness == Brightness.dark;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'RECLAMATION',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            AgrimedCartCounterIcon(
              onPressed: () {},
              iconColor: Colors.black,
            ),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                    darkMode ? AgrimedColors.black : AgrimedColors.white,
                expandedHeight: 420,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(AgrimedSize.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// search bar
                      const SizedBox(height: AgrimedSize.spaceBtwItems),
                      const SearchContainer(
                        text: 'Search',
                        showBackground: false,
                        showBorder: true,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(height: AgrimedSize.spaceBtwSections / 2),

                      ///  Claim Cat
                      SectionHeading(
                        title: 'DEP',
                        onPressed: () => Get.to(() => const AllDep()),
                      ),
                      const SizedBox(height: AgrimedSize.spaceBtwItems),

                      AgrimedGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const DepCard(
                              showBorder: true,
                            );
                          }),
                    ],
                  ),
                ),

                /// tuto (S3  , V8)
                bottom: const ATabBar(
                  tabs: [
                    Tab(child: Text(' IT')),
                    Tab(child: Text('Commercial')),
                    Tab(child: Text('Production')),
                    Tab(child: Text(' RH')),
                    Tab(child: Text(' Finance')),
                    Tab(child: Text('Administrative')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
              CategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
