import 'package:flutter/services.dart';
import 'package:real_app/resources/color_manager.dart';
import 'package:real_app/resources/font_manager.dart';
import 'package:real_app/resources/styles_manager.dart';
import 'package:real_app/resources/values_manager.dart';
import 'package:flutter/material.dart';

ThemeData getTheme() {
  return ThemeData(
    fontFamily: FontFamilys.fontFamily,
    primarySwatch: Colors.purple,
    accentColor: Colors.amber,


    // main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    splashColor: ColorManager.lightPrimary,
    //  تموج  ripple effect color

    // text theme
    textTheme: ThemeData.light().textTheme.copyWith(
      titleMedium: TextStyle(
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
    // app bar theme
    appBarTheme: AppBarTheme(
        elevation: AppSize.s4,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        )),
// cardview theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),

    // button theme
    buttonTheme: ButtonThemeData(
      disabledColor: ColorManager.grey1,
      buttonColor: ColorManager.primary,
      shape: const StadiumBorder(),
      splashColor: ColorManager.lightPrimary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s12)),
        textStyle: getRegularTextStyle(
            color: ColorManager.white, fontSize: FontSize.s16),
      ),
    ),

    // // text theme
    // textTheme: TextTheme(
    //     displayLarge: getSemiBoldTextStyle(
    //         color: ColorManager.darkGrey, fontSize: FontSize.s16),
    //     headlineLarge: getSemiBoldTextStyle(
    //         color: ColorManager.darkGrey, fontSize: FontSize.s16),
    //     titleMedium: getMediumTextStyle(
    //         color: ColorManager.primary, fontSize: FontSize.s16),
    //     titleSmall: getRegularTextStyle(
    //         color: ColorManager.white, fontSize: FontSize.s16),
    //     headlineMedium: getRegularTextStyle(
    //         color: ColorManager.darkGrey, fontSize: FontSize.s14),
    //     bodyLarge: getRegularTextStyle(color: ColorManager.grey1),
    //     bodySmall: getRegularTextStyle(color: ColorManager.grey),
    //     labelSmall: getBoldTextStyle(
    //         color: ColorManager.primary, fontSize: FontSize.s12),
    //   labelMedium: getRegularTextStyle(color: ColorManager.grey2, fontSize: FontSize.s12),
    // ),

// input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // enabled Border style
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          borderSide:
              BorderSide(color: ColorManager.grey, width: AppSize.s1_5)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5)),
      // error border style
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          borderSide:
              BorderSide(color: ColorManager.error, width: AppSize.s1_5)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s8),
          borderSide:
              BorderSide(color: ColorManager.primary, width: AppSize.s1_5)),
// hint text Style
      errorStyle: getRegularTextStyle(color: ColorManager.error),
      hintStyle:
          getRegularTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      labelStyle:
          getMediumTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
    ),

    bottomSheetTheme: BottomSheetThemeData(
        // elevation: AppSize.s1_5,
        backgroundColor: ColorManager.white.withOpacity(0)),
  );
}
