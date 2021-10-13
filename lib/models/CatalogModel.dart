// ignore_for_file: file_names

class CatalogModel {
   List<Item> _items = [];

   Item getByInd(int ind) => _items[ind];
   Item getById(int id) =>
      _items.firstWhere((element) => element.id == id);
   int getLength() => _items.length;

   add(Item item) => _items.add(item);
   remove(Item item) => _items.remove(item);
}

class Item {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
