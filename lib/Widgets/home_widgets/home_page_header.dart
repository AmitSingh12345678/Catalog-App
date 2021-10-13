import 'package:first_app/Widgets/MyAppTheme.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          "Catalog App"
              .text
              .color(Theme.of(context).primaryColorDark)
              .xl5
              .bold
              .make(),
          "Trending Items"
              .text
              .color(Theme.of(context).primaryColorDark)
              .xl2
              .make(),
        ],
      ),
    );
  }
}
