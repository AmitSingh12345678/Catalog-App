import 'package:first_app/Widgets/MyAppTheme.dart';
import 'package:first_app/Widgets/home_widgets/AddToCart.dart';
import 'package:first_app/models/CatalogModel.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  late Item item;
  HomeDetailPage({Key? key, required Item item}) : super(key: key) {
    this.item = item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Hero(tag: item.id, child: Image.network(item.image).hHalf(context)),
            VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: context.canvasColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      item.name.text
                          .color(Theme.of(context).primaryColorDark)
                          .xl4
                          .bold
                          .make(),
                      item.desc.text.xl
                          .color(Theme.of(context).primaryColorDark)
                          .caption(context)
                          .make(),
                      "Est et kasd aliquyam accusam ipsum rebum dolor sed lorem eirmod. Diam gubergren clita et erat et amet duo eos duo. Magna est ea accusam."
                          .text
                          .color(Theme.of(context).primaryColorDark)
                          .caption(context)
                          .make()
                          .pOnly(top: 8),
                    ],
                  ).py64().px32(),
                )).expand(),
            BottomAppBar(
              color: context.canvasColor,
              child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${item.price}"
                      .text
                      .color(Theme.of(context).primaryColorDark)
                      .xl3
                      .bold
                      .make(),
                AddToCart(item: item),
                ],
              ).px8(),
            )
          ],
        ),
      ),
    );
  }
}
