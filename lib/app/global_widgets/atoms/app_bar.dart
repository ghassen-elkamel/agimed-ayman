import 'package:flutter/material.dart';

import '../../core/utils/constant.dart';
import '../../core/values/colors.dart';

class AtomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool centerTitle;
  final bool withCloseIcon;
  final void Function()? onTapIcon;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool withMenu;
  final String? icon;
  final Widget? widget;
  final void Function()? onPressed;

  const AtomAppBar({
    Key? key,
    this.centerTitle = true,
    this.withCloseIcon = true,
    this.onTapIcon,
    this.scaffoldKey,
    this.icon = 'assets/images/logo.png',
    this.withMenu = false,
    this.widget,
    this.onPressed,
  }) : super(key: key);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      automaticallyImplyLeading: false,
      toolbarHeight: appBarHeight,
      backgroundColor: transparent,
      title: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: InkWell(
            onTap: onTapIcon,
            child: Image.asset(
              icon ?? 'assets/images/small_logo.png',
            ),
          )),
      actions: [
        widget ?? const SizedBox(),
      ],
      leading: withCloseIcon
          ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: white,
                ),
                onPressed: () => {
                  onPressed != null
                      ? onPressed?.call()
                      : Navigator.of(context).pop()
                },
              ),
            )
          : !withMenu
              ? null
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      color: white,
                    ),
                    onPressed: () => scaffoldKey?.currentState?.openDrawer(),
                  ),
                ),
      leadingWidth: 90,
      centerTitle: centerTitle,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, appBarHeight);
}
