import 'package:google_fonts/google_fonts.dart';

import 'file_collection.dart';

// Set Theme for app.

ThemeData themeData = ThemeData(
    useMaterial3: true,
    textTheme: GoogleFonts.aBeeZeeTextTheme(),
    fontFamily: GoogleFonts.aBeeZee().fontFamily,
    colorSchemeSeed: rubyRed,
    appBarTheme: const AppBarTheme(
        surfaceTintColor: rubyRed,
        backgroundColor: rubyRed,
        titleTextStyle: TextStyle(),
        toolbarTextStyle: TextStyle(),
        iconTheme: IconThemeData(color: Colors.white)),
    scaffoldBackgroundColor: Colors.white,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(foregroundColor: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: rubyRed,
      surfaceTintColor: rubyRed,
    )));
