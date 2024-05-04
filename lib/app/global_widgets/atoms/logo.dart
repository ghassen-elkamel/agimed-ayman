import 'package:flutter/material.dart';

class AtomLogo extends StatelessWidget {
  final double height;

  const AtomLogo({Key? key, this.height = 200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: "logo",
      child: SizedBox(
        height: height,
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
