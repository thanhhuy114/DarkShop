import 'dart:async';

import 'package:flutter/material.dart';

class CountDown extends StatefulWidget {
  const CountDown({super.key});

  @override
  State<CountDown> createState() => _CountDownState();
}

class _CountDownState extends State<CountDown> {
  late Duration duration = Duration(
      hours: 23 - DateTime.now().hour,
      minutes: 59 - DateTime.now().minute,
      seconds: 59 - DateTime.now().second);

  Timer? timer;
  String twoDigits(int n) => n.toString().padLeft(2, '0');

  void addTime() {
    const addSeconds = 1;
    setState(() {
      final seconds = duration.inSeconds - addSeconds;
      if (seconds < 0) {
        duration = const Duration(hours: 23, minutes: 59, seconds: 59);
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        children: [
          const Text('     DarFla⚡h Sale ',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 85, 85, 87))),
          _buildTimeCard(time: twoDigits(duration.inHours)),
          _buildTimeCard(time: twoDigits(duration.inMinutes.remainder(60))),
          _buildTimeCard(time: twoDigits(duration.inSeconds.remainder(60))),
        ],
      ),
    );
  }

  Widget _buildTimeCard({String time = '00'}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 244, 59, 59),
          borderRadius: BorderRadius.circular(4)),
      child: Text(
        time,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
            fontSize: 12),
      ),
    );
  }
}
