import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tick_tac_toe_flutter/models/difficulty.enum.model.dart';
import 'package:tick_tac_toe_flutter/models/player.enum.model.dart';
import 'package:tick_tac_toe_flutter/screens/game/user-input.widget.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}


class _GameWidgetState extends State<GameWidget> {
  Difficulty _difficulty = Difficulty.NORMAL;
  bool _isPlaying = false;
  List<int> _score = [0, 0];
  List<Player?> _gameboard = [null,null,null,null,null,null,null,null,null];
  Player _currentPlayer = Player.A;


  int? nextComputerMove(List<Player?> board) {
    final idx = board.indexWhere((e) => e == null);
    if (idx == -1) {
      return null;
    }
    return idx;
  }

  void makeMove(int tileIdx) {
    final board = [..._gameboard];
    board[tileIdx] = Player.A;
    final computerMove = this.nextComputerMove(board);
    if (computerMove != null) {
      board[computerMove] = Player.B;
    }

    setState(() {
      _gameboard = board;
      _currentPlayer = Player.A;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserInput(
          isEnabled: !_isPlaying,
          difficulty: _difficulty,
          onStartedChange: (bool started) {
            setState(() {
              _isPlaying = started;
            });
          },
          onDifficultyChange: (Difficulty d) {
            setState(() {
              _difficulty = d;
            });
          },
        ),
        Text('You ${_score[0]}:${_score[1]} PC'),
        Text('Current Player: $_currentPlayer'),
        Expanded(
            child: GameBoard(
              onTileClick: makeMove,
              gameboard: _gameboard
        )),
        ElevatedButton(onPressed: () {
          setState(() {
            _gameboard = [for (var i=0; i<9; i++) null];
          });
        }, child: const Text('Reset'))
      ],
    );
  }
}

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key, required this.gameboard, required this.onTileClick}) : super(key: key);

  final List<Player?> gameboard;

  final Function(int tileIdx) onTileClick;

  Widget createTile(Player? tile, int idx) {
    return InkWell(
      onTap: tile == null ? () {
        onTileClick(idx);
      } : null,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all()
        ),
        constraints: BoxConstraints(
          maxHeight: 100,
          maxWidth: 100,
          minHeight: 100,
          minWidth: 100
        ),
        
        child: tile == Player.A ? SvgPicture.asset('assets/O.svg') : (tile == Player.B ? SvgPicture.asset('assets/X.svg') : null)
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            createTile(gameboard[0], 0),
            createTile(gameboard[1], 1),
            createTile(gameboard[2], 2),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            createTile(gameboard[3], 3),
            createTile(gameboard[4], 4),
            createTile(gameboard[5], 5),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            createTile(gameboard[6], 6),
            createTile(gameboard[7], 7),
            createTile(gameboard[8], 8),
          ])
        ],
      )
    );
  }
}
