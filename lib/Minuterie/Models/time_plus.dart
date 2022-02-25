import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fonctionnalites/Minuterie/widgets/time_card_widget.dart';

class TimePlus extends StatefulWidget{
  const TimePlus({Key? key}) : super(key: key);

  @override
  State<TimePlus> createState() => _TimePlusState();
}

class _TimePlusState extends State<TimePlus> {
  static const countDownTemps = Duration(minutes: 10);
  Duration temps = const Duration();
  Timer? timer;

  bool isCountdown = true;

  @override
  void initState(){
    super.initState();
    startTime();
    reset();
  }

  void reset(){
    if (isCountdown) {setState(() => temps = countDownTemps);}
    else {setState(() => temps = const Duration());}
  }

  void addTime(){
    final addSeconds = isCountdown ? -1 : 1;
    setState((){
      final seconds = temps.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        temps = Duration(seconds: seconds);
      }
    });
  }

  void startTime(){
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2,'0');
    final minutes = twoDigits(temps.inMinutes.remainder(90));
    final seconds = twoDigits(temps.inSeconds.remainder(60));

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          timeCard(time: minutes, header: "MINUTES"),
          const SizedBox(width: 8,),
          timeCard(time: seconds, header: "SECONDS"),
        ],
      ),
    );
  }
}