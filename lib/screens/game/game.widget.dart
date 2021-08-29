import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tick_tac_toe_flutter/models/difficulty.enum.model.dart';
import 'package:tick_tac_toe_flutter/screens/game/user-input.widget.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  Difficulty _difficulty = Difficulty.NORMAL;
  bool isPlaying = false;
  List<int> score = [0, 0];
  List<String> game = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInput(
          isEnabled: !isPlaying,
          difficulty: _difficulty,
          onStartedChange: (bool started) {
            setState(() {
              isPlaying = started;
            });
          },
          onDifficultyChange: (Difficulty d) {
            setState(() {
              _difficulty = d;
            });
          },
        ),
        Text('You ${score[0]}:${score[1]} PC'),
        Expanded(
            child: GameBoard(
          game: game,
        ))
      ],
    );
  }
}

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key, required this.game}) : super(key: key);

  final List<String> game;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(game.first),
    );
  }
}
