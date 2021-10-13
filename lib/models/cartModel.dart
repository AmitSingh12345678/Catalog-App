import 'package:first_app/core/MyStore.dart';
import 'package:first_app/models/CatalogModel.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  List<int> _itemsIds = [];

  add(int id) => _itemsIds.add(id);
  remove(int id) => _itemsIds.remove(id);
  getId(int index) => _itemsIds[index];
  getLength() => _itemsIds.length;
  bool isPresent(int id) =>
      _itemsIds.firstWhere((element) => (element == id), orElse: () => -1) == -1
          ? true
          : false;
  getTotalPrice() {
    int totalPrice = 0;
    for (int id in _itemsIds) {
      totalPrice += (VxState.store as MyStore).catalog.getById(id).price;
    }
    return totalPrice;
  }
}

class AddMutation extends VxMutation<MyStore> {
  late  int id;
  AddMutation(this.id);
  @override
  perform() {
    store?.cart.add(id);
  }
}
class RemoveMutation extends VxMutation<MyStore> {
  late  int id;
  RemoveMutation(this.id);
  @override
  perform() {
    store?.cart.remove(id);
  }
}