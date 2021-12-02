import 'package:flutter/material.dart';
import 'package:tick_tac_toe_flutter/screens/game/game.widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(title: Text('Unbeatable Tic-Tac-Toe')),
            body: Container(margin: EdgeInsets.all(20), child: GameWidget())));
  }
}
