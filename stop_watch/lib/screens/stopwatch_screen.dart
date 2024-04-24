import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/stop_button.dart';
import '../widgets/pause_button.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  final _stopwatch = Stopwatch();
  late final Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(
      const Duration(milliseconds: 10),
      (timer) => setState(() => {}),
    );
  }

  // a function that will return a beautifully formatted text to be used as a
  // display
  String _formattedTime(int elapsedMilliseconds) {
    dynamic milliseconds = (elapsedMilliseconds % 1000) ~/ 10;
    dynamic seconds = (elapsedMilliseconds ~/ 1000) % 60;
    dynamic minutes = (elapsedMilliseconds ~/ 1000) ~/ 60;

    milliseconds = milliseconds.toString().padLeft(2, '0');
    seconds = seconds.toString().padLeft(2, '0');
    minutes = minutes.toString().padLeft(2, '0');

    return '$minutes:$seconds:$milliseconds';
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    _stopwatch.start();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: width,
              margin: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  _formattedTime(_stopwatch.elapsedMilliseconds),
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Row(
              children: [
                Expanded(child: PauseButton()),
                Expanded(child: StopButton()),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
