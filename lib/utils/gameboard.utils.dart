import 'package:tick_tac_toe_flutter/models/gameboard.model.dart';
import 'package:tick_tac_toe_flutter/models/player.enum.model.dart';

class GameboardUtils {
  static Gameboard empty() => List.filled(9, null);

  static bool tryMakeMove(Gameboard board, Player player, int? tileIdx) {
    if (tileIdx == null) {
      return false;
    }

    board[tileIdx] = GameTile(player);

    return !isGameOver(board);
  }

  static bool isGameOver(Gameboard board) {
    return false;
  }
}
