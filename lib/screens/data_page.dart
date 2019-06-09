import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../widgets/item_card.dart';
import '../stores/data_store.dart';

class DataPage extends StatefulWidget {
  final DataStore store;
  DataPage(this.store, {Key key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  // This tween with the slide transition will cause the item to slide from right to left into the list
  final Tween<Offset> _tween = Tween<Offset>(
    begin: Offset(1.0, 0.0),
    end: Offset.zero,
  );

  @override
  void initState() {
    super.initState();
    widget.store.items.observe((listChange) {
      if (listChange.added?.isNotEmpty ?? false) {
        // an item has been added, synchronise the items displayed within the AnimatedList with the items within an our store
        _listKey.currentState.insertItem(listChange.index - 1);
      }
      if (listChange.removed?.isNotEmpty ?? false) {
        // an item has been removed, synchronise the items displayed within the AnimatedList with the items within an our store.
        // note that when removing the AnimatedList will play the animation in reverse (left to right) for us so can reuse the
        // same tween for adding in items
        _listKey.currentState.removeItem(
            listChange.index,
            (context, animation) => SlideTransition(
                  position: animation.drive(_tween),
                  child: ItemCard(listChange.removed.first, false),
                ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated List demo'),
      ),
      body: Column(children: [
        Expanded(
          child: AnimatedList(
            key: _listKey,
            initialItemCount: 0,
            itemBuilder: (context, index, animation) => SlideTransition(
                  position: animation.drive(_tween),
                  child: ItemCard(widget.store.items[index], true),
                ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 8.0),
          child: Observer(
            builder: (_) => Text('${widget.store.items.length} items(s)'),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.store.addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
