import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tick_tac_toe_flutter/models/player.enum.model.dart';
import 'package:tick_tac_toe_flutter/models/gameboard.model.dart';

class GameBoard extends StatelessWidget {
  const GameBoard(
      {Key? key, required this.gameboard, required this.onTileClick})
      : super(key: key);

  final Gameboard gameboard;

  final Function(int tileIdx) onTileClick;

  Widget createTile(GameTile? tile, int idx) {
    return InkWell(
        onTap: tile == null
            ? () {
                onTileClick(idx);
              }
            : null,
        child: Container(
            decoration: BoxDecoration(border: Border.all()),
            constraints: BoxConstraints(
                maxHeight: 100, maxWidth: 100, minHeight: 100, minWidth: 100),
            child: tile != null
                ? (tile.player == Player.Human
                    ? SvgPicture.asset('assets/O.svg', color: tile.color)
                    : (tile.player == Player.Computer
                        ? SvgPicture.asset('assets/X.svg', color: tile.color)
                        : null))
                : null));
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
    ));
  }
}
