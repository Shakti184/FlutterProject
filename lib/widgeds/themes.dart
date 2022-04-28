import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext) => ThemeData(primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      primaryTextTheme: GoogleFonts.latoTextTheme(),
      appBarTheme: AppBarTheme(
        color: Color.fromARGB(214, 133, 5, 5),
        elevation: 0.0,
        iconTheme: IconThemeData(color:Colors.black ),
      )
      );
  static ThemeData darkTheme(BuildContext)=> ThemeData(
        brightness: Brightness.dark,
  );
}