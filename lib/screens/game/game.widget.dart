import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tick_tac_toe_flutter/models/gameboard.model.dart';
import 'package:tick_tac_toe_flutter/models/player.enum.model.dart';
import 'package:tick_tac_toe_flutter/screens/game/gameboard.widget.dart';
import 'package:tick_tac_toe_flutter/utils/engine.utils.dart';
import 'package:tick_tac_toe_flutter/utils/gameboard.utils.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  List<int> _score = [0, 0];
  Gameboard _gameboard = GameboardUtils.empty();

  bool _isGameOver = false;
  Player? _winner = null;
  

  void setGameOver(Player winner) {
    final score = [..._score];
    score[winner.index] += 1;
    setState(() {
      _isGameOver = true;
      _winner = winner;
      _score = score;
    });
  }

  void onTileClick(int tileIdx) {
    if (_isGameOver) {
      return;
    }
    final board = [..._gameboard];
    if (!GameboardUtils.tryMakeMove(board, Player.Human, tileIdx)) {
      setGameOver(Player.Human);
      setState(() {
        _gameboard = board;
      });
      return;
    }

    final int? computerMove = EngineUtils.computeMove(board);
    if (!GameboardUtils.tryMakeMove(board, Player.Computer, computerMove)) {
      setGameOver(Player.Computer);
      setState(() {
        _gameboard = board;
      });
      return;
    }

    setState(() {
      _gameboard = board;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('You ${_score[0]}:${_score[1]} PC'),
        Text(_isGameOver ? 'GAMEOVER Winner: ' + _winner.toString() : ''),
        Expanded(
            child: GameBoard(onTileClick: onTileClick, gameboard: _gameboard, disabled: _isGameOver)),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _gameboard = GameboardUtils.empty();
                _isGameOver = false;
                _winner = null;
              });
            },
            child: const Text('Reset'))
      ],
    );
  }
}
