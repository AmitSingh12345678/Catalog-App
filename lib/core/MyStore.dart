import 'package:first_app/models/CatalogModel.dart';
import 'package:first_app/models/cartModel.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
  }
}
