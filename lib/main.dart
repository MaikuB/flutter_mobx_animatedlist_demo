import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/data_page.dart';
import 'stores/data_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataStore>(
      builder: (_) => DataStore(),
      child: Consumer<DataStore>(
        builder: (context, value, child) => MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: DataPage(value),
            ),
      ),
    );
  }
}
