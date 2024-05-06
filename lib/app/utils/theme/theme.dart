import 'package:flutter/material.dart';

import '../../core/utils/theme/custom_theme/appbar_theme.dart';
import '../../core/utils/theme/custom_theme/bottom_sheet_theme.dart';
import '../../core/utils/theme/custom_theme/checkbox_theme.dart';
import '../../core/utils/theme/custom_theme/chip_theme.dart';
import '../../core/utils/theme/custom_theme/elevated_button_theme.dart';
import '../../core/utils/theme/custom_theme/outlined_button_theme.dart';
import '../../core/utils/theme/custom_theme/text_field_theme.dart';
import '../../core/utils/theme/custom_theme/text_theme.dart';

class AgrimedAppTheme {
  AgrimedAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.lightGreen,
    textTheme: AgrimedTextTheme.lightTextTheme,
    chipTheme: AgrimedChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AgrimedAppBarTheme.lightAppBarTheme,
    checkboxTheme: AgrimedCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: AgrimedBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: AgrimedElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: AgrimedOutlinedButtonTheme.lightOutlinedTheme,
    inputDecorationTheme: AgrimedTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.lightGreen,
    textTheme: AgrimedTextTheme.darkTextTheme,
    chipTheme: AgrimedChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AgrimedAppBarTheme.darkAppBarTheme,
    checkboxTheme: AgrimedCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: AgrimedBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: AgrimedElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: AgrimedOutlinedButtonTheme.darktOutlinedTheme,
    inputDecorationTheme: AgrimedTextFormFieldTheme.darkInputDecorationTheme,
  );
}
