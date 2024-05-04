import 'package:flutter/material.dart';

import '../../core/values/colors.dart';

class AtomCheckBox extends StatelessWidget {
  final bool value;
  final void Function(bool?)? onChanged;

  const AtomCheckBox({
    Key? key,
    this.value = false,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 24,
      child: Checkbox(
        value: value,
        onChanged: onChanged,
        side: const BorderSide(color: primaryColor, width: 2.0),
        activeColor: primaryColor,
      ),
    );
  }
}
