import 'package:flutter/material.dart';

import '../../../app/core/values/size.dart';
import '../../core/theme/text.dart';
import '../../core/values/colors.dart';

class AtomIconWithLabel extends StatelessWidget {
  final String? label;
  final IconData icon;
  final Color? iconColor;
  final Color labelColor;
  final double? iconSize;
  final bool? isCenter;
  final bool withExpandedText;
  final double? labelSize;
  final TextDirection? textDirection;

  const AtomIconWithLabel({
    super.key,
    required this.label,
    required this.icon,
    this.iconColor = black,
    this.labelColor = black,
    this.iconSize = 16,
    this.withExpandedText = false,
    this.textDirection,
    this.isCenter,
    this.labelSize,
  });

  @override
  Widget build(BuildContext context) {
    Widget text = CustomText(
      label,
      color: labelColor,
      textDirection: textDirection,
      fontSize: labelSize ?? mSize,
      fontWeight: FontWeight.w500,
      maxLines: null,
      overflow: null,
    );

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: isCenter == true
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        children: [
          Icon(
            color: iconColor,
            icon,
            size: iconSize,
          ),
          const SizedBox(
            width: 8,
          ),
          withExpandedText ? Flexible(child: text) : text,
        ],
      ),
    );
  }
}
