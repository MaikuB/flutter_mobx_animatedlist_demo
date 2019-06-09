import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item.dart';
import '../stores/data_store.dart';

class ItemCard extends StatelessWidget {
  final Item _item;
  final bool _removable;

  const ItemCard(this._item, this._removable, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child:
                  Text('Item added at ${_item.dateAdded.toIso8601String()}')),
          RaisedButton(
              child: Text('Remove'),
              onPressed: _removable
                  ? () {
                      Provider.of<DataStore>(context).removeItem(_item);
                    }
                  : null),
        ],
      ),
    );
  }
}
