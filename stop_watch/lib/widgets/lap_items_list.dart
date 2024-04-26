import 'package:flutter/material.dart';

class LapItemsList extends StatelessWidget {
  final List<Map<String, String>> laps;

  const LapItemsList(this.laps, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: laps.length,
      itemBuilder: (ctx, index) => laps.isEmpty
          ? const Text('When you add laps, you will see them here.')
          : ListTile(
              leading: Text((laps.length - index).toString()),
              title: Text(
                '${laps[index]['totalTime']} ${laps[index]['fromLast']}',
              ),
            ),
    );
  }
}
