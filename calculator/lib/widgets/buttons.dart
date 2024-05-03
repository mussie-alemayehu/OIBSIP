import 'dart:math';

import 'package:calculator/models/button_types.dart' as types;
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final void Function(String value) onPressed;

  const Buttons(this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = (MediaQuery.of(context).size.height * 2) / 3;

    // use the minimum of the fourth of the screen width or height or 80 as the
    // radius of the button
    final buttonRadius = min((width - 24) / 4, (height) / 5).toDouble();

    const buttonTypes = types.ButtonType.values;

    // sublist from 12 to the end and remove equal button
    final lastTypes = buttonTypes.sublist(12)..remove(types.ButtonType.equals);
    final lastValues =
        lastTypes.map((nwtyp) => types.buttonValue[nwtyp]).toList();

    return Column(
      children: [
        // this will generate the first three rows of buttons
        ...List.generate(
          3,
          (outdex) {
            return Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  outdex == 4 ? 2 : 4,
                  (index) {
                    final type = buttonTypes[(outdex * 4) + index];
                    final value =
                        types.buttonValue[buttonTypes[(outdex * 4) + index]]!;

                    return Expanded(
                      flex: type == types.ButtonType.zero ? 2 : 1,
                      child: Container(
                        width: buttonRadius,
                        height: height / 5,
                        margin: const EdgeInsets.all(4),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).colorScheme.tertiary,
                              shape: const CircleBorder(),
                            ),
                            child: FittedBox(child: Text(value)),
                            onPressed: () => onPressed(value)),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
        // take the last two rows out of the natural flow because they are not natural
        // indices 12 to end, except equal button, are added in the next row
        Expanded(
          flex: 2,
          // divide this row into two rows because the children have different shapes
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // to generate the remaining numbers and dot buttons
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Expanded(
                      // this row will hold the buttons one, two and three
                      child: Row(
                        children: List.generate(
                          3,
                          (index) => Expanded(
                            child: Container(
                              width: buttonRadius,
                              height: height / 5,
                              margin: const EdgeInsets.all(4),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.tertiary,
                                    shape: const CircleBorder(),
                                  ),
                                  child: FittedBox(
                                      child: Text(lastValues[index]!)),
                                  onPressed: () =>
                                      onPressed(lastValues[index]!)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      // this row will hold the buttons zero and period
                      child: Row(
                        children: List.generate(
                          2,
                          (index) {
                            // add three to get the real index of the buttons in the list
                            final realIndex = index + 3;

                            // to check whether we are building zero button or not
                            final zero = realIndex == 3;

                            return Expanded(
                              // zero should take the place of two buttons horizontally
                              flex: zero ? 2 : 1,
                              child: Container(
                                width: buttonRadius,
                                height: height / 5,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: zero ? 12 : 4,
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Theme.of(context).colorScheme.tertiary,
                                    // shape should not be circle for zero button
                                    shape: zero
                                        ? RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          )
                                        : const CircleBorder(),
                                  ),
                                  child: FittedBox(
                                      child: Text(lastValues[realIndex]!)),
                                  onPressed: () => onPressed(
                                    lastValues[realIndex]!,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // for the equal button
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 12),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.tertiary,
                            // shape should not be circle for equal button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: FittedBox(
                              child: Text(
                                  types.buttonValue[types.ButtonType.equals]!)),
                          onPressed: () => onPressed(
                            '=',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
