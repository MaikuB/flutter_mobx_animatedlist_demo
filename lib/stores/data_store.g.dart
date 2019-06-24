// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$DataStore on _DataStore, Store {
  Computed<String> _$itemsFooterComputed;

  @override
  String get itemsFooter =>
      (_$itemsFooterComputed ??= Computed<String>(() => super.itemsFooter))
          .value;

  final _$itemsAtom = Atom(name: '_DataStore.items');

  @override
  ObservableList<Item> get items {
    _$itemsAtom.context.enforceReadPolicy(_$itemsAtom);
    _$itemsAtom.reportObserved();
    return super.items;
  }

  @override
  set items(ObservableList<Item> value) {
    _$itemsAtom.context.enforceWritePolicy(_$itemsAtom);
    super.items = value;
    _$itemsAtom.reportChanged();
  }

  final _$_DataStoreActionController = ActionController(name: '_DataStore');

  @override
  void addItem() {
    final _$actionInfo = _$_DataStoreActionController.startAction();
    try {
      return super.addItem();
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(Item item) {
    final _$actionInfo = _$_DataStoreActionController.startAction();
    try {
      return super.removeItem(item);
    } finally {
      _$_DataStoreActionController.endAction(_$actionInfo);
    }
  }
}
