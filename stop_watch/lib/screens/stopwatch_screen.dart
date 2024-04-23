import 'dart:async';

import 'package:flutter/material.dart';

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
    dynamic milliseconds = (elapsedMilliseconds % 1000);
    dynamic seconds = (elapsedMilliseconds / 1000).truncate() % 60;
    dynamic minutes = ((elapsedMilliseconds / 1000).truncate() / 60).truncate();

    milliseconds = milliseconds.toString().padLeft(2, '0');
    seconds = seconds.toString().padLeft(2, '0');
    minutes = minutes.toString().padLeft(2, '0');

    return '$minutes:$seconds:$milliseconds';
  }

  @override
  Widget build(BuildContext context) {
    _stopwatch.start();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stopwatch'),
      ),
      body: Center(
        child: Text(
          _formattedTime(_stopwatch.elapsedMilliseconds),
        ),
      ),
    );
  }
}
