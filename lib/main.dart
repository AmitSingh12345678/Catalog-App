import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/login_page.dart';
import 'package:first_app/utils/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.light,
        theme: ThemeData(
            primarySwatch: Colors.purple,
            fontFamily: GoogleFonts.lato().fontFamily),
        darkTheme: ThemeData(brightness: Brightness.dark),
        initialRoute: AppRoutes.homeRoute,
        routes: {
          AppRoutes.baseRoute: (context) => LoginPage(),
          AppRoutes.homeRoute: (context) => HomePage(),
          AppRoutes.loginRoute: (context) => LoginPage()
        });
  }
}
