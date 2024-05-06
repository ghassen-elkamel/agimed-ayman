import 'package:agimed/app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Home',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: AgrimedColors.white)),
            leading: const Icon(Iconsax.home),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
