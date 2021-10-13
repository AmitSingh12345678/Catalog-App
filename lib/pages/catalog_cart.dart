import 'package:first_app/Widgets/MyAppTheme.dart';
import 'package:first_app/core/MyStore.dart';
import 'package:first_app/models/CatalogModel.dart';
import 'package:first_app/models/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogCart extends StatelessWidget {
  CatalogCart({Key? key}) : super(key: key);
  final MyStore store = (VxState.store as MyStore);
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart"
            .text
            .bold
            .xl3
            .color(Theme.of(context).primaryColorDark)
            .make(),
      ),
      body: Column(
        children: [
          store.cart.getLength() == 0
              ? "Your cart is empty : ("
                  .text
                  .xl2
                  .color(Theme.of(context).primaryColorDark)
                  .make()
                  .centered()
                  .expand()
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: store.cart.getLength(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      title:
                          "${store.catalog.getById(store.cart.getId(index)).name}"
                              .text
                              .bold
                              .color(Theme.of(context).primaryColorDark)
                              .xl
                              .make(),
                      subtitle:
                          "\$${store.catalog.getById(store.cart.getId(index)).price}"
                              .text
                              .color(Theme.of(context).primaryColorDark)
                              .caption(context)
                              .make(),
                      trailing: IconButton(
                        icon: Icon(Icons.remove_circle_outline),
                        onPressed: () {
                          RemoveMutation(store.cart.getId(index));
                        },
                        color: Theme.of(context).primaryColorDark,
                      ),
                    );
                  },
                ).p16().expand(),
          Divider(),
          BottomAppBar(
            color: context.canvasColor,
            child: ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                "\$${store.cart.getTotalPrice()}"
                    .text
                    .color(Theme.of(context).primaryColorDark)
                    .xl3
                    .bold
                    .make(),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: "Out of Stock : (".text.make()));
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(StadiumBorder()),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).primaryColor)),
                  child: "Buy".text.xl.make(),
                ).w(120).h(40)
              ],
            ).px8(),
          )
        ],
      ),
    );
  }
}
