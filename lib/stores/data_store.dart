import 'package:mobx/mobx.dart';
import '../models/item.dart';

part 'data_store.g.dart';

class DataStore = _DataStore with _$DataStore;

abstract class _DataStore with Store {
  @observable
  ObservableList<Item> items = ObservableList<Item>();

  @computed
  String get itemsFooter =>
      "${items.length} ${(items.length == 1) ? 'item' : 'items'}";

  @action
  void addItem() {
    items.add(Item(DateTime.now().toUtc()));
  }

  @action
  void removeItem(Item item) {
    items.remove(item);
  }
}
