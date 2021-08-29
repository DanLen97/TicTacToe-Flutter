import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tick_tac_toe_flutter/models/difficulty.enum.model.dart';

class UserInput extends StatelessWidget {
  const UserInput(
      {Key? key,
      this.isEnabled = true,
      required this.onDifficultyChange,
      required this.difficulty,
      required this.onStartedChange})
      : super(key: key);

  final bool isEnabled;
  final Difficulty difficulty;
  final Function(Difficulty diff) onDifficultyChange;
  final Function(bool hasStared) onStartedChange;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      child: Row(
        children: [
          Expanded(
              child: DropdownButtonFormField(
                  value: difficulty.index,
                  onChanged: isEnabled
                      ? (int? value) {
                          return onDifficultyChange(
                              Difficulty.values[value ?? -1]);
                        }
                      : null,
                  decoration: const InputDecoration(labelText: 'Difficulty'),
                  validator: (int? value) {
                    if (value == null) {
                      return 'Select difficulty';
                    }
                    return null;
                  },
                  items: Difficulty.values
                      .map((e) => new DropdownMenuItem(
                            value: e.index,
                            child: Text(
                                "${describeEnum(e)[0]}${describeEnum(e).substring(1).toLowerCase()}"),
                          ))
                      .toList())),
          ElevatedButton(
              onPressed: () {
                onStartedChange(true);
              },
              child: const Text('Start'))
        ],
      ),
    ));
  }
}
