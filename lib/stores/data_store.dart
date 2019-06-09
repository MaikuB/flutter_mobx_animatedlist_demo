import 'package:mobx/mobx.dart';
import '../models/item.dart';

// Include generated file
part 'data_store.g.dart';

// This is the class used by rest of your codebase
class DataStore = _DataStore with _$DataStore;

// The store-class
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
