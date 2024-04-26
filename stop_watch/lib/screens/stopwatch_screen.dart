import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/start_button.dart';
import '../widgets/stop_button.dart';
import '../widgets/stop_reset_button.dart';
import '../widgets/lap_button.dart';
import '../widgets/lap_items_list.dart';

class StopwatchScreen extends StatefulWidget {
  const StopwatchScreen({super.key});

  @override
  State<StopwatchScreen> createState() => _StopwatchScreenState();
}

class _StopwatchScreenState extends State<StopwatchScreen> {
  final _stopwatch = Stopwatch();
  late final Timer timer;

  // a variable that will hold lap information
  final List<Map<String, int>> _laps = [];

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
    dynamic minutes = ((elapsedMilliseconds ~/ 1000) ~/ 60) % 60;
    dynamic hours = ((elapsedMilliseconds ~/ 1000) ~/ 60) ~/ 60;

    milliseconds = milliseconds.toString().padLeft(2, '0');
    seconds = seconds.toString().padLeft(2, '0');
    minutes = minutes.toString().padLeft(2, '0');

    if (hours > 0) {
      hours = hours.toString();
      return '$hours:$minutes:$seconds';
    }

    return '$minutes:$seconds:$milliseconds';
  }

  // a function that will be used to stop and reset the stopwatch
  // this function will also clear our laps information since it will not be
  // necessary if the stopwatch is restarted
  void _stopAndReset() {
    _stopwatch.stop();
    _stopwatch.reset();

    setState(() => _laps.clear());
  }

  // a function that will be used to add a lap
  void _lap() {
    // the lap item will have two attributes, one measures the duration since
    // the last lap and one measures since the beginning of the stopwatch
    final fromLast = _laps.isEmpty
        ? _stopwatch.elapsedMilliseconds
        : _stopwatch.elapsedMilliseconds - _laps.last['totalTime']!;
    final totalTime = _stopwatch.elapsedMilliseconds;

    setState(
      () => _laps.add({
        'fromLast': fromLast,
        'totalTime': totalTime,
      }),
    );
  }

  // this is the widget that will be displayed when the stopwatch is not running
  // and it is in its initial state
  Widget _initialWidgets() {
    // an icon that will be used to start the stopwatch
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StartButton(_stopwatch.start),
      ],
    );
  }

  // this is the widget that will be displayed when the stopwatch is running
  Widget _stopwatchRunningWidgets() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // an icon that will be used to stop the stopwatch
            StopButton(_stopwatch.stop),
            // an icon that will be used to reset the stopwatch
            StopAndResetButton(_stopAndReset),
          ],
        ),
        LapButton(_lap),
      ],
    );
  }

  // this is the widget that will be displayed when the stopwatch is not running
  // and it is not in its initial state
  Widget _stopwatchNotRunningWidgets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // an icon that will be used to start the stopwatch
        StartButton(_stopwatch.start),
        // an icon that will be used to reset the stopwatch
        StopAndResetButton(_stopAndReset),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // create a beautifully formatted text of the laps
    final formattedLaps = _laps
        .map<Map<String, String>>((value) {
          return {
            'fromLast': _formattedTime(value['fromLast']!),
            'totalTime': _formattedTime(value['totalTime']!),
          };
        })
        .toList()
        .reversed
        .toList();

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
            if (_laps.isNotEmpty)
              Expanded(
                child: LapItemsList(formattedLaps),
              ),
            // this container holds the stopwatch counter
            Container(
              height: width,
              margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
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
