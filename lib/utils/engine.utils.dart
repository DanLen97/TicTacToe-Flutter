import 'package:tick_tac_toe_flutter/models/gameboard.model.dart';

class EngineUtils {
  static int? computeMove(Gameboard board) {
    final idx = board.indexWhere((e) => e == null);
    if (idx == -1) {
      return null;
    }
    return idx;
  }
}
