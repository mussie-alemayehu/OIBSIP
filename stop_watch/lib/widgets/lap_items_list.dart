import 'package:flutter/material.dart';

class LapItemsList extends StatelessWidget {
  final List<Map<String, String>> laps;

  const LapItemsList(this.laps, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // a row that will be used to display a header for the laps
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Index',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Lap time',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Total time',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: laps.length,
            itemBuilder: (ctx, index) => laps.isEmpty
                ? const Text('When you add laps, you will see them here.')
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                    '#${(laps.length - index).toString()}'),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(laps[index]['fromLast']!),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Text(laps[index]['totalTime']!),
                              ),
                            ),
                          ],
                        ),
                        Divider(color: Theme.of(context).primaryColor),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
