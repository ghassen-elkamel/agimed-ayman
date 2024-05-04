import 'package:flutter/material.dart';

import '../../core/theme/text.dart';
import '../../core/values/colors.dart';

class AtomTag extends StatelessWidget {
  const AtomTag({
    super.key,
    required String? text,
    this.iconData,
    this.isSelected = false,
    this.padding = 12,
    this.margin = 8,
    this.onTap,
    this.color,
    this.hintColor,
  }) : label = text ?? "";

  final String label;
  final IconData? iconData;
  final bool isSelected;
  final void Function()? onTap;
  final Color? color;
  final Color? hintColor;
  final double padding;
  final double margin;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(margin),
        child: DecoratedBox(
          decoration: BoxDecoration(
              color: isSelected ? color ?? primaryColor : hintColor ?? white30,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (iconData != null)
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Icon(
                      iconData,
                      color: isSelected ? Colors.white : color ?? Colors.white,
                    ),
                  ),
                CustomText.l(
                  label,
                  color: isSelected ? Colors.white : color ?? Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
