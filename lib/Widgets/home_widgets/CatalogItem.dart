// ignore_for_file: file_names, prefer_initializing_formals

import 'package:first_app/Widgets/MyAppTheme.dart';
import 'package:first_app/Widgets/home_widgets/AddToCart.dart';
import 'package:first_app/models/CatalogModel.dart';
import 'package:first_app/models/cartModel.dart';
import 'package:first_app/utils/AppRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogItem extends StatelessWidget {
  late Item item;
  CatalogItem({Key? key, required Item item}) : super(key: key) {
    this.item = item;
  }

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Card(
      child: Row(
        children: [
          Hero(
            tag: item.id,
            child: Image.network(item.image)
                .box
                .color(Theme.of(context).cardColor)
                .p16
                .rounded
                .make()
                .w24(context)
                .p16(),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              item.name.text
                  .color(Theme.of(context).primaryColorDark)
                  .size(18)
                  .bold
                  .make(),
              item.desc.text
                  .color(Theme.of(context).primaryColorDark)
                  .caption(context)
                  .make(),
              SizedBox(
                height: 8,
              ),
              ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                children: [
                  "\$${item.price}"
                      .text
                      .bold
                      .color(Theme.of(context).primaryColorDark)
                      .make(),
                  AddToCart(item: item),
                ],
              ).px8(),
            ],
          ))
        ],
      ),
    )).square(150).color(Theme.of(context).cardColor).make();
  }
}
