extension ParseDouble on String? {
  double? get tryDouble => double.tryParse(toString().replaceAll(",", "."));
}
