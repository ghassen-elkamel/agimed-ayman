import 'package:flutter/material.dart';

class AgrimedOutlinedButtonTheme{
  AgrimedOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    elevation: 0,
    foregroundColor: Colors.black,
    side: const BorderSide(color: Colors.lightGreen),
  textStyle: const TextStyle(fontSize: 16,color: Colors.black, fontWeight: FontWeight.w600),
    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
  ) ,

  );

  static OutlinedButtonThemeData darktOutlinedTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.lightGreenAccent),
      textStyle: const TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.w600),
      padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    ) ,

  );
}