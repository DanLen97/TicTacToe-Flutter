import 'package:flutter/material.dart';
import 'package:tick_tac_toe_flutter/models/gameboard.model.dart';
import 'package:tick_tac_toe_flutter/models/player.enum.model.dart';


final List<List<int>> win = [[0, 1, 2], // Check first Row
                             [3, 4, 5], // Check second Row
                             [6, 7, 8], // Check third Row
                             [0, 3, 6], // Check first column
                             [1, 4, 7], // Check second Column
                             [2, 5, 8], // Check third Column
                             [0, 4, 8], // Check first Diagonal
                             [2, 4, 6]]; // Check second Diagonal

final winColor = Colors.green;
        

class GameboardUtils {
  static Gameboard empty() => List.filled(9, null);

  static bool tryMakeMove(Gameboard board, Player player, int? tileIdx) {
    if (tileIdx == null) {
      return false;
    }

    board[tileIdx] = GameTile(player);

    return !isGameOver(board, player);
  }

  static bool isGameOver(Gameboard board, Player player) {
    for (var i = 0; i < 8; i++) {
      if (board[win[i][0]]?.player == player &&
          board[win[i][1]]?.player == player &&
          board[win[i][2]]?.player == player) {
        board[win[i][0]]?.color = winColor;
        board[win[i][1]]?.color = winColor;
        board[win[i][2]]?.color = winColor;
        return true;
      }
    }
    return false;
  }
}
