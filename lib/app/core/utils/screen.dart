import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

bool isMobile(BuildContext context) {
  return !kIsWeb || MediaQuery.of(context).size.width < 750;
}

bool isSmall(BuildContext context) {
  return MediaQuery.of(context).size.width < 500;
}
