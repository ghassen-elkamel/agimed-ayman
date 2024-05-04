import 'package:flutter/material.dart';

import '../../core/utils/screen.dart';
import '../../core/values/colors.dart';
import '../../global_widgets/atoms/app_bar.dart';
import '../atoms/floating_action_button.dart';
import '../atoms/curved_navigation_bar.dart';

class AppScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Widget body;
  final AtomFloatingActionButton? floatingActionButton;
  final bool withMenu;
  final bool withCloseIcon;
  final bool withAppBar;
  final bool withFloatingAction;
  final bool centerTitle;
  final int? drawerIndex;
  final int? navigationBarIndex;
  final void Function()? onTapIcon;
  final String? icon;
  final bool withButtonNavBar;
  final Color? backgroundColor;
  final Widget? widget;
  final void Function()? onPressed;

  AppScaffold({
    Key? key,
    required this.body,
    this.withMenu = true,
    this.withCloseIcon = false,
    this.withFloatingAction = false,
    this.centerTitle = true,
    this.floatingActionButton,
    this.withAppBar = true,
    this.drawerIndex,
    this.navigationBarIndex,
    this.icon,
    this.onTapIcon,
    this.withButtonNavBar = false,
    this.widget,
    this.backgroundColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (withAppBar && isMobile(context))
          ? AtomAppBar(
              centerTitle: centerTitle,
              scaffoldKey: _scaffoldKey,
              withMenu: withMenu,
              withCloseIcon: withCloseIcon,
              icon: icon,
              onTapIcon: onTapIcon,
              widget: widget,
              onPressed: onPressed,
            )
          : null,
      key: _scaffoldKey,
      backgroundColor: backgroundColor ?? black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: body,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: withFloatingAction
          ? floatingActionButton ??
              FloatingActionButton(
                onPressed: () {},
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("assets/icons/main_page_icon.png"),
                ),
              )
          : null,
      bottomNavigationBar: withButtonNavBar && navigationBarIndex != null
          ? AtomCurvedNavigationBar(
              selectedIndex: navigationBarIndex!,
            )
          : null,
    );
  }
}
