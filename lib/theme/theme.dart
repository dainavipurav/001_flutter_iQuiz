import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'colors.dart';

class AppTheme {
  static const MaterialColor lightSwatch = MaterialColor(
    0xFFF6821F,
    <int, Color>{
      50: Color(0xfffef0e4),
      100: Color(0xFFfcd1ad),
      200: Color(0xFFfab377),
      300: Color(0xFFf79540),
      400: Color(0xFFf5760a),
      500: AppColors.primary,
      600: Color(0xFFbf5c08),
      700: Color(0xFF884205),
      800: Color(0xFf522703),
      900: Color(0xFF1b0d01),
    },
  );

  static const ColorScheme lightScheme = ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: AppColors.mainText,
    background: AppColors.background,
    onBackground: AppColors.backgroundCard,
    secondary: AppColors.secondary,
    onSecondary: AppColors.secondaryText,
    secondaryContainer: AppColors.secondaryContainer,
    tertiary: AppColors.tertiary,
    onTertiary: AppColors.tertiaryText,
    error: AppColors.warning,
    brightness: Brightness.light,
    onPrimaryContainer: AppColors.onPrimaryContainer,
    outline: AppColors.line,
    onSurface: AppColors.onSurface,
    primaryContainer: AppColors.primaryContainer,
    onSecondaryContainer: AppColors.onSecondaryContainer,
    tertiaryContainer: AppColors.tertiaryContainer,
    onTertiaryContainer: AppColors.onTertiaryContainer,
    surfaceVariant: AppColors.surfaceVariant,
  );

  static final AppBarTheme appBarTheme = AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ),
    actionsIconTheme: const IconThemeData(
      color: AppColors.background,
    ),
    color: AppColors.primary,
    elevation: 7.0,
    titleTextStyle: headline6.copyWith(color: AppColors.background),
    centerTitle: false,
    iconTheme: const IconThemeData(
      color: AppColors.background,
    ),
    titleSpacing: 0,
  );

  static final ButtonThemeData elevatedButton = ButtonThemeData(
    buttonColor: AppColors.primary,
    disabledColor: AppColors.primary.withOpacity(0.5),
    padding: const EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
  );

  static const TextStyle headline1 = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24,
  );
  static const TextStyle headline2 = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  static const TextStyle headline3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle headline4 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle headline5 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle headline6 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle bodyText2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle subtitle1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle subtitle2 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static ThemeData dateTimePickerTheme = ThemeData.light().copyWith(
    dialogBackgroundColor: AppColors.tertiaryContainer,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
    highlightColor: Colors.grey[400],
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: Colors.grey,
      cursorColor: Colors.grey,
    ),
  );

  static final InputDecoration inputDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    isDense: true,
    errorMaxLines: 3,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
    ),
    labelStyle: const TextStyle(
      color: AppColors.tertiary,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Poppins',
    ),
    hintStyle: TextStyle(
      color: AppColors.mainText.withOpacity(0.5),
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    fillColor: AppColors.background,
    errorStyle: const TextStyle(
      fontSize: 12,
      color: AppColors.warning,
    ),
    filled: true,
  );

  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    isDense: true,
    errorMaxLines: 3,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(color: Colors.grey),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
    ),
    labelStyle: const TextStyle(
      color: AppColors.tertiary,
      fontSize: 14.0,
      fontWeight: FontWeight.normal,
      fontFamily: 'Poppins',
    ),
    hintStyle: TextStyle(
      color: AppColors.mainText.withOpacity(0.5),
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    fillColor: AppColors.background,
    errorStyle: const TextStyle(
      fontSize: 12,
      color: AppColors.warning,
    ),
    filled: true,
  );

  static const DialogTheme dialogTheme = DialogTheme(
    backgroundColor: AppColors.background,
    contentTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.mainText,
    ),
    elevation: 6,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    titleTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryText,
    ),
  );

  static const DividerThemeData divider = DividerThemeData(
    color: AppColors.line,
    thickness: 1,
  );

  static TabBarTheme tabs = TabBarTheme(
    unselectedLabelColor: AppColors.tertiary,
    labelColor: AppColors.secondary,
    unselectedLabelStyle: button.copyWith(color: AppColors.tertiary),
    labelStyle: button.copyWith(color: AppColors.secondary),
    indicator: const UnderlineTabIndicator(
      borderSide: BorderSide(color: AppColors.secondary, width: 4),
    ),
  );

  static final light = ThemeData.light().copyWith(
    appBarTheme: appBarTheme,
    scaffoldBackgroundColor: AppColors.background,
    backgroundColor: Colors.red,
    colorScheme: lightScheme,
    buttonTheme: elevatedButton,
    cardTheme: CardTheme(
      color: AppColors.mainText,
      elevation: 0.0,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    ),
    tabBarTheme: tabs,
    dividerTheme: divider,
    dialogTheme: dialogTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: const StadiumBorder(),
        elevation: 0,
        onPrimary: Colors.white,
        shadowColor: Colors.transparent,
      ),
    ),
    highlightColor:
        Colors.transparent, //EmpowerColors.primary.withOpacity(0.25),
    inputDecorationTheme: inputDecorationTheme,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        primary: AppColors.secondary,
        backgroundColor: AppColors.secondary.withOpacity(0.1),
        shape: const StadiumBorder(),
        side: BorderSide(color: AppColors.secondary.withOpacity(0.1)),
      ),
    ),
    primaryColor: AppColors.primary,
    primaryIconTheme: const IconThemeData(color: AppColors.secondaryText),
    splashColor: Colors.transparent, //EmpowerColors.primary.withOpacity(0.4),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: AppColors.primary),
    ),
    textTheme: TextTheme(
      headline1: headline1.copyWith(color: AppColors.mainText),
      headline2: headline2.copyWith(color: AppColors.mainText),
      headline3: headline3.copyWith(color: AppColors.mainText),
      headline4: headline4.copyWith(color: AppColors.mainText),
      headline5: headline5.copyWith(color: AppColors.mainText),
      headline6: headline6.copyWith(color: AppColors.mainText),
      bodyText1: bodyText1.copyWith(
        color: AppColors.mainText.withOpacity(0.5),
      ),
      bodyText2: bodyText2.copyWith(color: AppColors.secondaryText),
      subtitle1: subtitle1.copyWith(color: AppColors.mainText),
      subtitle2: subtitle2.copyWith(color: AppColors.secondary),
      button: button.copyWith(color: Colors.white),
      caption: caption.copyWith(color: AppColors.mainText),
    ).apply(
      fontFamily: 'Poppins',
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
    unselectedWidgetColor: AppColors.secondaryText,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
    ),
  );

//----------------------- Application Dark Theme  ------------------------

}
