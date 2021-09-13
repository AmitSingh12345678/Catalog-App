import 'package:first_app/Widgets/AppDrawer.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    int day = 19;
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalogue App"),
      ),

      body: Center(
        child: Container(
          child: Text("Welcome to our flutter app on day $day"),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
