import 'dart:convert';

import 'package:first_app/Widgets/AppDrawer.dart';
import 'package:first_app/Widgets/home_widgets/CatalogItem.dart';
import 'package:first_app/Widgets/MyAppTheme.dart';
import 'package:first_app/Widgets/home_widgets/catalog_list.dart';
import 'package:first_app/Widgets/home_widgets/home_page_header.dart';
import 'package:first_app/core/MyStore.dart';
import 'package:first_app/models/CatalogModel.dart';
import 'package:first_app/utils/AppRoutes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Item> tempList = List.generate(25, (index) => CatalogModel.items[0]);
  final MyStore store = (VxState.store as MyStore);

  @override
  void initState() {
    buildList();
    super.initState();
  }

  buildList() async {
    await Future.delayed(Duration(seconds: 2));
    final String response =
        await rootBundle.loadString("assets/files/catalogJson.json");
    final data = await json.decode(response);
    final items = data["products"];
    
    for (var item in items) {
      store.catalog.add(Item(
          id: item["id"],
          name: item["name"],
          color: item["color"],
          desc: item["desc"],
          price: item["price"],
          image: item["image"]));
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomePageHeader(),
              SizedBox(
                height: 8,
              ),
              if (store.catalog.getLength() > 0)
                CatalogList().expand()
              else
                Center(
                    child: CircularProgressIndicator(
                  color: Theme.of(context).indicatorColor,
                )).expand(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.catalogCartRoute);
        },
      ),
    );
  }
}
