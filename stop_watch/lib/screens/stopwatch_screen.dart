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

  // this is the widget that will be displayed when the stopwatch is not running
  // and it is in its initial state
  Widget _initialWidgets() {
    // an icon that will be used to start the stopwatch
    return Row(
      children: [
        Expanded(
          child: Tooltip(
            message: 'Start',
            child: InkWell(
              onTap: _stopwatch.start,
              child: const StartButton(),
            ),
          ),
        ),
      ],
    );
  }

  // this is the widget that will be displayed when the stopwatch is running
  Widget _stopwatchRunningWidgets() {
    return Row(
      children: [
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
      ],
    );
  }

  // this is the widget that will be displayed when the stopwatch is not running
  // and it is not in its initial state
  Widget _stopwatchNotRunningWidgets() {
    return Row(
      children: [
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
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Stopwatch',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // this container holds the stopwatch counter
            Container(
              height: width,
              margin: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Center(
                child: Text(
                  _formattedTime(_stopwatch.elapsedMilliseconds),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            _stopwatch.isRunning
                ? _stopwatchRunningWidgets()
                : _stopwatch.elapsedMilliseconds == 0
                    ? _initialWidgets()
                    : _stopwatchNotRunningWidgets(),
          ],
        ),
      ),
    );
  }
}
