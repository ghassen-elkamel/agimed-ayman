import 'dart:math' as math;

import 'package:flutter/material.dart';

class AtomSpinnerProgressIndicator extends StatefulWidget {
  const AtomSpinnerProgressIndicator({Key? key}) : super(key: key);

  @override
  State<AtomSpinnerProgressIndicator> createState() =>
      _AtomSpinnerProgressIndicatorState();
}

class _AtomSpinnerProgressIndicatorState
    extends State<AtomSpinnerProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * math.pi,
            child: child,
          );
        },
        child: Image.asset("assets/icons/spinner.png", width: 80),
      ),
    );
  }
}
