import 'package:flutter/material.dart';

import '../../core/theme/text.dart';
import '../../core/theme/text_theme.dart';
import '../../core/utils/screen.dart';
import '../../core/values/colors.dart';
import '../../data/enums/button_type.dart';

class AtomButton extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  final ButtonColor buttonColor;
  final Color? textColor;
  final bool isSmall;
  final bool blueBorder;
  final double width;
  final double height;
  final double radius;
  final IconData? icon;
  final Color iconColor;

  const AtomButton({
    Key? key,
    required this.label,
    this.buttonColor = ButtonColor.primary,
    this.blueBorder = false,
    this.onPressed,
    this.isSmall = true,
    this.textColor,
    this.width = 350,
    this.height = 60,
    this.radius = 12,
    this.icon,
    this.iconColor = white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(10),
        minimumSize: MaterialStateProperty.all(
          isSmall ? Size(width, height) : Size.fromHeight(height),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(
              color: blueBorder ? primaryColor : Colors.transparent,
            ),
          ),
        ),
        textStyle: MaterialStateProperty.all(styleFontBebasW400Size18),
        shadowColor: MaterialStateProperty.all(white15),
        foregroundColor:
            MaterialStateProperty.all(getOnPressedColor(buttonColor)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return getOnPressedColor(buttonColor);
            } else if (states.contains(MaterialState.disabled)) {
              return greyLight;
            }
            return getButtonColor(buttonColor);
          },
        ),
      ),
      child: (icon != null)
          ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile(context) ? 8.0 : 30.0,
                vertical: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(
                      icon,
                      color: iconColor,
                    ),
                  ),
                  CustomText.l(
                    label,
                    color: getLabelColor(buttonColor),
                  ),
                ],
              ),
            )
          : CustomText.l(
              label,
              color: getLabelColor(buttonColor),
            ),
    );
  }

  getOnPressedColor(ButtonColor buttonColor) {
    switch (buttonColor) {
      case ButtonColor.primary:
        return primaryColor.withOpacity(0.7);
      case ButtonColor.white:
        return black.withOpacity(0.005);
      case ButtonColor.third:
        return thirdColor.withOpacity(0.7);
      case ButtonColor.greyLight:
        return white.withOpacity(0.7);
      case ButtonColor.greenLight:
        return greenLight.withOpacity(0.7);
      case ButtonColor.red:
        return red.withOpacity(0.7);
    }
  }

  getLabelColor(ButtonColor buttonColor) {
    if (onPressed == null) {
      return white20;
    }

    if (textColor != null) {
      return textColor;
    }
    switch (buttonColor) {
      case ButtonColor.white:
        return primaryColor;

      case ButtonColor.third:
        return white;

      case ButtonColor.primary:
        return white;

      case ButtonColor.greyLight:
        return primaryColor;

      case ButtonColor.greenLight:
        return white;

      case ButtonColor.red:
        return white;
    }
  }

  getButtonColor(ButtonColor buttonColor) {
    if (onPressed == null) {
      return white10;
    }

    switch (buttonColor) {
      case ButtonColor.white:
        return white;

      case ButtonColor.third:
        return thirdColor;

      case ButtonColor.primary:
        return primaryColor;

      case ButtonColor.greyLight:
        return greyLight.withOpacity(0.7);

      case ButtonColor.greenLight:
        return greenLight;

      case ButtonColor.red:
        return red;
    }
  }
}
