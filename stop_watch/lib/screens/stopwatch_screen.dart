import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/start_button.dart';
import '../widgets/stop_button.dart';
import '../widgets/stop_reset_button.dart';

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

    _stopwatch.start();
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

  // a function that will be used to stop and reset the stopwatch
  void _stopAndReset() {
    _stopwatch.stop();
    _stopwatch.reset();
  }

  List<Widget> _initialWidgets() {
    // an icon that will be used to start the stopwatch
    return [
      Expanded(
        child: Tooltip(
          message: 'Start',
          child: InkWell(
            onTap: _stopwatch.start,
            child: const StartButton(),
          ),
        ),
      ),
    ];
  }

  List<Widget> _stopwatchRunningWidgets() {
    return [
      // an icon that will be used to stop the stopwatch
      Expanded(
        child: Tooltip(
          message: 'Stop',
          child: InkWell(
            onTap: () => _stopwatch.stop(),
            child: const StopButton(),
          ),
        ),
      ),
      // an icon that will be used to reset the stopwatch
      Expanded(
        child: Tooltip(
          message: 'Stop and reset',
          child: InkWell(
            onTap: _stopAndReset,
            child: const StopAndResetButton(),
          ),
        ),
      ),
    ];
  }

  List<Widget> _stopwatchNotRunningWidgets() {
    return [
      // an icon that will be used to start the stopwatch
      Expanded(
        child: Tooltip(
          message: 'Start',
          child: InkWell(
            onTap: _stopwatch.start,
            child: const StartButton(),
          ),
        ),
      ),
      // an icon that will be used to reset the stopwatch
      Expanded(
        child: Tooltip(
          message: 'Stop and reset',
          child: InkWell(
            onTap: _stopAndReset,
            child: const StopAndResetButton(),
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

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
            Row(
              children: _stopwatch.isRunning
                  ? _stopwatchRunningWidgets()
                  : _stopwatch.elapsedMilliseconds == 0
                      ? _initialWidgets()
                      : _stopwatchNotRunningWidgets(),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
