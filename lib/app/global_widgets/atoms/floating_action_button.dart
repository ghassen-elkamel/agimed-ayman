import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

class AtomFloatingActionButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final double? bottomPadding;

  const AtomFloatingActionButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.bottomPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding ?? 20.0),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: primaryColor,
        child: child,
      ),
    );
  }
}
