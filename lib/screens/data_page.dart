import 'package:flutter/material.dart';
import 'package:flutter_mobx_animatedlist_demo/widgets/item_card.dart';
import '../stores/data_store.dart';

class DataPage extends StatefulWidget {
  final DataStore store;
  DataPage(this.store, {Key key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final Tween<Offset> _tween = Tween<Offset>(
    begin: Offset(1.0, 0.0),
    end: Offset.zero,
  );

  @override
  void initState() {
    super.initState();
    widget.store.items.observe((listChange) {
      if (listChange.added?.isNotEmpty ?? false) {
        _listKey.currentState.insertItem(listChange.index - 1);
      }
      if (listChange.removed?.isNotEmpty ?? false) {
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
      body: AnimatedList(
        key: _listKey,
        initialItemCount: 0,
        itemBuilder: (context, index, animation) => SlideTransition(
              position: animation.drive(_tween),
              child: ItemCard(widget.store.items[index], true),
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.store.addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
