import 'package:flutter/material.dart';

import 'curved_edges.dart';

class AgrimedCurvedEdgeWidget extends StatelessWidget {
  const AgrimedCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: AgrimedCurvedEdges(),
      child: child,
    );
  }
}
