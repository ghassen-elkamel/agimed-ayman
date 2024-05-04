import 'package:flutter/material.dart';

class AtomLabel extends StatelessWidget {
  final String text;

  const AtomLabel({Key? key, this.text = ""}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}
