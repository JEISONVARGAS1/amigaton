import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountdownTimerPage extends StatefulWidget {
  @override
  _CountdownTimerPageState createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  late int _remainingTime;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _calculateRemainingTime();
    _startTimer();
  }

  void _calculateRemainingTime() {
    final now = DateTime.now();
    final targetDate = DateTime(2024, 9, 8, 18, 0, 0); // 6:00 PM, 8th August 2024

    if (now.isBefore(targetDate)) {
      _remainingTime = targetDate.difference(now).inSeconds;
    } else {
      _remainingTime = 0;
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  String _formattedTime() {
    final days = (_remainingTime ~/ 86400).toString().padLeft(2, '0');
    final hours = ((_remainingTime % 86400) ~/ 3600).toString().padLeft(2, '0');
    final minutes = ((_remainingTime % 3600) ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingTime % 60).toString().padLeft(2, '0');

    return "$days días $hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          _formattedTime(),
          style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}