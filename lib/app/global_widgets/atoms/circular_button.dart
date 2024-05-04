import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

class CircularButton extends StatelessWidget {
  final void Function()? onPressed;
  final IconData icon;
  final String tag;
  final double height;

  const CircularButton(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.tag,
      this.height = 51})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 51,
      child: FloatingActionButton(
        heroTag: tag,
        onPressed: onPressed,
        elevation: 8,
        backgroundColor: white,
        child: Icon(
          icon,
        ),
      ),
    );
  }
}
