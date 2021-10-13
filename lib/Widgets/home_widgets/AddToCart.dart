// ignore_for_file: file_names

import 'package:first_app/core/MyStore.dart';
import 'package:first_app/models/CatalogModel.dart';
import 'package:first_app/models/cartModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  late Item item;

  AddToCart({Key? key, required Item item}) : super(key: key) {
    this.item = item;
  }
  final MyStore store = (VxState.store as MyStore);
  @override
  Widget build(BuildContext context) {
    bool isAdded = !store.cart.isPresent(item.id);
    VxState.watch(context, on: [AddMutation,RemoveMutation]);
    return ElevatedButton(
      onPressed: () {
        if(!isAdded)
        AddMutation(item.id);

        print("item added");
      },
      style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          backgroundColor:
              MaterialStateProperty.all(Theme.of(context).primaryColor)),
      child: isAdded ? Icon(Icons.done) : "Add to Cart".text.make(),
    );
  }
}
