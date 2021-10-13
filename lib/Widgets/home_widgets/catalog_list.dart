import 'package:first_app/Widgets/home_widgets/CatalogItem.dart';
import 'package:first_app/core/MyStore.dart';
import 'package:first_app/models/CatalogModel.dart';
import 'package:first_app/pages/home_detail.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
   CatalogList({Key? key}) : super(key: key);
final MyStore store = (VxState.store as MyStore);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: store.catalog.getLength(),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomeDetailPage(item: store.catalog.getByInd(index)),));
            },
            child: CatalogItem(item: store.catalog.getByInd(index)));
      },
    );
  }
}
