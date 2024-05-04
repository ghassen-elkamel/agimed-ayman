import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

class AtomRadioButton<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget? prefix;
  final void Function(T? value) onChanged;

  const AtomRadioButton({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.groupValue,
    this.prefix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          if (prefix != null) Expanded(child: prefix!),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: SizedBox.square(
              dimension: 16,
              child: Radio(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: primaryColor,
                fillColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  return primaryColor;
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
