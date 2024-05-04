extension NotNullAndNotEmpty on String? {
  bool get isFilled => this != null && this!.trim().isNotEmpty;
}
