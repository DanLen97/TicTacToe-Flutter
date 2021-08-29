

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tick_tac_toe_flutter/models/difficulty.enum.model.dart';
import 'package:tick_tac_toe_flutter/screens/game/user-input.widget.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({ Key? key }) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {

  Difficulty _difficulty = Difficulty.NORMAL;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInput(isEnabled: true),
        Expanded(
          child: GameBoard()
        )
      ],
    );
  }
}


class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('Hi'),);
  }
}

