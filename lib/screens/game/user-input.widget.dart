import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tick_tac_toe_flutter/models/difficulty.enum.model.dart';

class UserInput extends StatelessWidget {
  const UserInput({Key? key, this.isEnabled = true}) : super(key: key);

  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Form(
      child: Row(
        children: [
          Expanded(
              child: DropdownButtonFormField(
                  value: 2,
                  onChanged: isEnabled ? (int? value) {} : null,
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
                      .toList())
          ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Start')
        )
        ],
      ),
    ));
  }
}
