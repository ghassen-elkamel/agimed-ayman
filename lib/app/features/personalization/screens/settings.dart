import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/appbar/appbar.dart';
import '../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../common/widgets/list_tiles/user_profile_tile.dart';
import '../../../common/widgets/texts/section_heading.dart';
import '../../../core/utils/constants/colors.dart';
import '../../../core/utils/constants/sizes.dart';
import '../../app_pages/screens/profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// header
            AgrimedHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: AgrimedColors.white),
                    ),
                  ),

                  /// user profile card
                  AgrimedProfileTile(
                      onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: AgrimedSize.spaceBtwSections),
                ],
              ),
            ),

            /// body
            Padding(
              padding: const EdgeInsets.all(AgrimedSize.defaultSpace),
              child: Column(
                children: [
                  /// Account Settings
                  const SectionHeading(
                    title: 'Account Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: AgrimedSize.spaceBtwSections),

                  SettingsMenuTile(
                    icon: Iconsax.ranking,
                    title: 'Post',
                    subtitle: ' set your rank ?',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.call,
                    title: 'Phone ',
                    subtitle: ' set phone number ?',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'DEP',
                    subtitle: ' set DEP name ?',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subtitle: ' notification ?',
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    icon: Iconsax.security,
                    title: 'Account Privacy',
                    subtitle: ' Manage Data',
                    onTap: () {},
                  ),

                  ///  App Settings
                  const SizedBox(height: AgrimedSize.spaceBtwSections),
                  const SectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(height: AgrimedSize.spaceBtwSections),
                  SettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Load Data ',
                      subtitle: ' Upload Data to ure database',
                      onTap: () {}),

                  /// logout button
                  const SizedBox(height: AgrimedSize.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text('Logout')),
                  ),
                  const SizedBox(height: AgrimedSize.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
