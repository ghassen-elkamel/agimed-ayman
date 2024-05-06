import 'package:agimed/app/features/app_pages/screens/profile/widget/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),

      /// Body

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AgrimedSize.defaultSpace),
          child: Column(
            children: [
              /// Profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const AgrimedCircularImage(
                      image: AgrimedImages.darkAppLogo,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),

              /// Detail
              const SizedBox(height: AgrimedSize.spaceBtwSections / 2),
              const Divider(),
              const SizedBox(height: AgrimedSize.spaceBtwSections),
              const SectionHeading(
                title: 'Profile information',
                showActionButton: false,
              ),
              const SizedBox(height: AgrimedSize.spaceBtwSections),

              ProfileMenu(onPressed: () {}, title: 'Name', value: 'USER 1'),
              ProfileMenu(onPressed: () {}, title: 'Username', value: 'user1'),

              const SizedBox(height: AgrimedSize.spaceBtwSections),
              const Divider(),
              const SizedBox(height: AgrimedSize.spaceBtwSections),

              /// Heading personal info
              const SectionHeading(
                title: 'Personal information',
                showActionButton: false,
              ),
              const SizedBox(height: AgrimedSize.spaceBtwSections),

              ProfileMenu(
                  onPressed: () {},
                  title: 'User ID',
                  icon: Iconsax.copy,
                  value: '#0001'),
              ProfileMenu(
                  onPressed: () {}, title: 'E-mail', value: 'user01@gmail.com'),
              ProfileMenu(
                  onPressed: () {}, title: 'Phone Number', value: '20 123 987'),
              ProfileMenu(
                  onPressed: () {},
                  title: 'Date of Birth',
                  value: 'DD/MM/YYYY'),
              const Divider(),
              const SizedBox(height: AgrimedSize.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
