import 'package:flutter/material.dart';

import '../constant/app_colors.dart';

class CustomTheme {
  // todo: Typography textTheme
  // /// Typography
  // static final textTheme = TextTheme(
  //   displayLarge: TextStyle(
  //     color: AppColors.black,
  //     fontSize: 57,
  //     fontWeight: CustomFontWeight.regular,
  //     height: 68 / 57,
  //   ),

  /// color_scheme
  // static final colorScheme = const ColorScheme(
  //   brightness: Brightness.light,
  //   primary: null,
  //   onPrimary: null,
  //   secondary: null,
  //   onSecondary: null,
  //   error: AppColors.negative,
  //   onError: null,
  //   surface: null,
  //   onSurface: null,
  // );
}

extension ColorSchemeEx on ColorScheme {
  Color get positive => AppColors.positive;
  Color get negative => AppColors.negative;

}
