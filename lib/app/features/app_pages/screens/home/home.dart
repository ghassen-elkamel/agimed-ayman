import 'package:agimed/app/features/app_pages/screens/home/widgets/home_appbar.dart';
import 'package:agimed/app/features/app_pages/screens/home/widgets/home_departement.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products.cart/reclam_card/reclam_card_vertical.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../all_reclams/all_reclams.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String email;

/*
  void initState(){
    super.initState();
    Map<String,dynamic> jwtDecodedToken= JwtDecoder.decode(widget.token);

    email = jwtDecodedToken['email'];
  }

 */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const AgrimedHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  THomeAppBar(),
                  SizedBox(height: AgrimedSize.spaceBtwSections),

                  /// Searchbar
                  SearchContainer(text: 'Search'),
                  SizedBox(height: AgrimedSize.spaceBtwSections),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: AgrimedSize.defaultSpace),
                    child: Column(
                      children: [
                        SectionHeading(
                          title: 'Department',
                          showActionButton: false,
                        ),
                        SizedBox(height: AgrimedSize.spaceBtwItems),

                        /// Department
                        HomeDepartement(),
                      ],
                    ),
                  ),
                  SizedBox(height: AgrimedSize.spaceBtwSections),
                ],
              ),
            ),

            /// body (section 3 v 5)
            Padding(
              padding: const EdgeInsets.all(AgrimedSize.defaultSpace),
              child: Column(
                children: [
                  /// heading
                  SectionHeading(
                    title: 'CLAIM OF THE DAY',
                    onPressed: () => Get.to(() => const AllReclamation()),
                  ),
                  const SizedBox(height: AgrimedSize.spaceBtwItems),

                  /// reclam of the day (section 3 v7)
                  AgrimedGridLayout(
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) =>
                        const AgrimedCardVertical(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
