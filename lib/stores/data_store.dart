import 'package:mobx/mobx.dart';
import '../models/item.dart';

part 'data_store.g.dart';

class DataStore = _DataStore with _$DataStore;

abstract class _DataStore with Store {
  @observable
  ObservableList<Item> items = ObservableList<Item>();

  @action
  void addItem() {
    items.add(Item(DateTime.now().toUtc()));
  }

  @action
  void removeItem(Item item) {
    items.remove(item);
  }
}
