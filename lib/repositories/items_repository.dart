import 'package:intership_assigment/models/item.dart';
import 'package:intership_assigment/services/items_service.dart';


class ItemsRepository {
  final ItemsService _itemsService = ItemsService();

  Future<List<Item>> getItems() async {
    return await _itemsService.fetchItems();
  }
}
