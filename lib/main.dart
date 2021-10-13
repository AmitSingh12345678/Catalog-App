import 'package:first_app/Widgets/MyAppTheme.dart';
import 'package:first_app/core/MyStore.dart';
import 'package:first_app/pages/catalog_cart.dart';
import 'package:first_app/pages/home_page.dart';
import 'package:first_app/pages/login_page.dart';
import 'package:first_app/utils/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: MyStore(),child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: MyAppTheme.lightTheme,
        darkTheme: MyAppTheme.darkTheme,
        initialRoute: AppRoutes.homeRoute,
        routes: {
          AppRoutes.baseRoute: (context) => LoginPage(),
          AppRoutes.homeRoute: (context) => HomePage(),
          AppRoutes.loginRoute: (context) => LoginPage(),
          AppRoutes.catalogCartRoute: (context) => CatalogCart(),
        });
  }
}
