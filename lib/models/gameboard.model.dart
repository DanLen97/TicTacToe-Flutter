import 'package:flutter/material.dart';
import 'package:tick_tac_toe_flutter/models/player.enum.model.dart';

typedef Gameboard = List<GameTile?>;

class GameTile {
  Player player;
  Color color = Colors.black;

  GameTile(this.player);
}
