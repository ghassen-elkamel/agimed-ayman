import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../core/theme/text_theme.dart';
import '../atoms/check_box.dart';

class MoleculeCheckBoxLabel extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;
  final String checkBoxText;
  final String clickableCheckBoxText;
  final void Function()? onTextClick;

  const MoleculeCheckBoxLabel({
    Key? key,
    this.value = false,
    required this.onChanged,
    required this.checkBoxText,
    this.clickableCheckBoxText = '',
    this.onTextClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: AtomCheckBox(
            value: value,
            onChanged: onChanged,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: '$checkBoxText ',
                  style: styleBlackLightFontRobotoW400Size16,
                ),
                TextSpan(
                  text: clickableCheckBoxText,
                  style: stylePrimaryColorFontRobotoW400Size16Underline,
                  recognizer: TapGestureRecognizer()..onTap = onTextClick,
                ),
                if (clickableCheckBoxText.isNotEmpty)
                  TextSpan(
                    text: "*",
                    style: stylePrimaryColorFontRobotoW400Size16,
                    recognizer: TapGestureRecognizer()..onTap = onTextClick,
                  ),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
