import 'package:flutter/material.dart';

import '../../core/resources/colors_manager.dart';
import 'font_manager.dart';
import 'styles_manager.dart';

class ThemeManager {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: ColorsManager.white,
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsManager.blue,
          primary: ColorsManager.blue,
          secondary: ColorsManager.cyan,
          surface: ColorsManager.white,
        ),
        fontFamily: FontConstants.fontFamily,
        textTheme: TextTheme(
          bodyLarge: getRegularStyle(color: ColorsManager.ink, fontSize: FontSize.s16),
          bodyMedium: getRegularStyle(color: ColorsManager.ink, fontSize: FontSize.s14),
          bodySmall: getRegularStyle(color: ColorsManager.muted, fontSize: FontSize.s12),
          titleMedium: getMediumStyle(color: ColorsManager.ink, fontSize: FontSize.s16),
          titleLarge: getBoldStyle(color: ColorsManager.navy, fontSize: FontSize.s22),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: ColorsManager.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
          hintStyle: getRegularStyle(color: ColorsManager.muted, fontSize: FontSize.s13),
          labelStyle: getRegularStyle(color: ColorsManager.muted, fontSize: FontSize.s13),
          errorStyle: getRegularStyle(color: Colors.red, fontSize: FontSize.s12),
          prefixIconColor: ColorsManager.ink,
          suffixIconColor: ColorsManager.muted,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: ColorsManager.border, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: ColorsManager.blue, width: 1.4),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: Colors.red, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28),
            borderSide: const BorderSide(color: Colors.red, width: 1.4),
          ),
        ),
      );
}
