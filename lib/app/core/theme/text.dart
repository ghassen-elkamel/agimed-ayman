import 'package:flutter/material.dart';

import '../values/colors.dart';
import '../values/font_family.dart';
import '../values/size.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final double fontSize;
  final Color color;
  final String fontFamily;
  final FontWeight fontWeight;
  final bool isGradient;
  final TextDirection? textDirection;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const CustomText(
    this.text, {
    Key? key,
    this.fontSize = mSize,
    this.color = black,
    this.fontFamily = secondFamily,
    this.fontWeight = FontWeight.w200,
    this.textDirection,
    this.textAlign,
    this.isGradient = false,
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  const CustomText.xs(
    this.text, {
    Key? key,
    this.color = white,
    this.fontFamily = secondFamily,
    this.fontWeight = FontWeight.w300,
    this.textDirection,
    this.textAlign,
    this.isGradient = false,
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
  })  : fontSize = xsSize,
        super(
          key: key,
        );

  const CustomText.sm(
    this.text, {
    Key? key,
    this.color = white,
    this.fontFamily = firstFamily,
    this.fontWeight = FontWeight.w400,
    this.textDirection,
    this.textAlign,
    this.isGradient = false,
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
  })  : fontSize = smSize,
        super(
          key: key,
        );

  const CustomText.m(
    this.text, {
    Key? key,
    this.color = white,
    this.fontFamily = firstFamily,
    this.fontWeight = FontWeight.w500,
    this.textDirection,
    this.textAlign,
    this.isGradient = false,
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
  })  : fontSize = mSize,
        super(
          key: key,
        );

  const CustomText.l(
    this.text, {
    Key? key,
    this.color = white,
    this.fontFamily = firstFamily,
    this.fontWeight = FontWeight.w600,
    this.textDirection,
    this.textAlign,
    this.isGradient = false,
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
  })  : fontSize = lSize,
        super(
          key: key,
        );

  const CustomText.xl(
    this.text, {
    Key? key,
    this.color = white,
    this.fontFamily = firstFamily,
    this.fontWeight = FontWeight.w800,
    this.textDirection,
    this.textAlign,
    this.isGradient = false,
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
  })  : fontSize = xlSize,
        super(
          key: key,
        );

  const CustomText.xxl(
    this.text, {
    Key? key,
    this.color = white,
    this.fontFamily = firstFamily,
    this.fontWeight = FontWeight.w800,
    this.textDirection,
    this.textAlign,
    this.isGradient = false,
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
  })  : fontSize = xxlSize,
        super(
          key: key,
        );

  const CustomText.showAll(
    this.text, {
    Key? key,
    this.color = white,
    this.fontSize = xxlSize,
    this.fontFamily = firstFamily,
    this.fontWeight = FontWeight.w800,
    this.textDirection,
    this.textAlign = TextAlign.left,
    this.isGradient = false,
    this.maxLines,
    this.overflow,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return const SizedBox();
    }

    return Text(
      text!,
      style: TextStyle(
        color: isGradient ? null : color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        foreground: isGradient
            ? (Paint()
              ..shader = textLinearGradient.createShader(
                const Rect.fromLTWH(0.0, 0.0, 300.0, 70.0),
              ))
            : null,
        height: 1.5,
      ),
      textDirection: textDirection,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}
