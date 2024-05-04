import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../core/values/colors.dart';


class AtomCurvedNavigationBar extends StatefulWidget {
  int selectedIndex;

  AtomCurvedNavigationBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  State<AtomCurvedNavigationBar> createState() =>
      _AtomCurvedNavigationBarState();
}

class _AtomCurvedNavigationBarState extends State<AtomCurvedNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar(
      icons: const [
        Icons.home_filled,
        Icons.calendar_month,
        Icons.tv,
        Icons.abc
      ],
      backgroundColor: black30,
      activeIndex: widget.selectedIndex,
      gapLocation: GapLocation.center,
      iconSize: 30,
      onTap: (index) {
        setState(() {
          widget.selectedIndex = index;
        });
      },
      activeColor: primaryColor,
      inactiveColor: white,
    );
  }
}
