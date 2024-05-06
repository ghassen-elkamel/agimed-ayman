import 'package:flutter/material.dart';

///custom class for light and dark text themes
class AgrimedCheckboxTheme{
  AgrimedCheckboxTheme._();

  /// custom light text theme
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)){
        return Colors.white;
      }
      else{
        return Colors.black;
      }
    }),
    fillColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)){
        return Colors.lightGreen;
      }
      else {
        return Colors.transparent;
      }
    })

  );

  /// custom dark text theme
  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)){
          return Colors.white;
        }
        else{
          return Colors.black;
        }
      }),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)){
          return Colors.lightGreen;
        }
        else {
          return Colors.transparent;
        }
      })

  );
}