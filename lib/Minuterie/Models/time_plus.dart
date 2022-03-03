import 'dart:async';

import 'package:flutter/material.dart';

import '../widgets/buttons_widget.dart';
import '../widgets/time_card_widget.dart';

class TimePlus extends StatefulWidget{
  final int compteArebout;
  final bool decrement;

  const TimePlus({
    Key? key,
    this.compteArebout = 90,
    this.decrement = false,
  }) : super(key: key);

  @override
  State<TimePlus> createState() => _TimePlusState();
}

class _TimePlusState extends State<TimePlus> {
  Duration temps = const Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTime();
    reset();
  }

  void reset() {
    Duration countDownTemps = Duration(minutes: widget.compteArebout);
    if (widget.decrement) {
      setState(() => temps = countDownTemps);
    }
    else {
      setState(() => temps = const Duration());
    }
  }

  void addTime() {
    final addSeconds = widget.decrement ? -1 : 15;
    setState(() {
      final seconds = temps.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      }else {
        if (addSeconds == 15 && temps.inMinutes == widget.compteArebout-1){
          stopTime(resets: true);
        }
        temps = Duration(seconds: seconds);
      }
    });
  }

  void startTime({bool resets = true}) {
    if (resets){reset();}
    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTime({bool resets = true}){
    if (resets){reset();}
    setState(() => timer?.cancel());
  }

  @override
  Widget build(BuildContext context) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(temps.inMinutes.remainder(widget.compteArebout));
    final seconds = twoDigits(temps.inSeconds.remainder(60));

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              timeCard(time: minutes, header: "min"),
              const SizedBox(width: 8,),
              timeCard(time: seconds, header: "sec"),
            ],
          ),
          buildButtons(),
        ],
      ),
    );
  }

  Widget buildButtons() {
    final isRunning = timer == null ? false : timer!.isActive;
    final isCompleted = temps.inSeconds == 0;

    return isRunning || !isCompleted
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                text: isRunning ? "Stop" : "Resumer",
                onClicked: () {
                  if (isRunning){
                    stopTime(resets: false);
                  }else{
                    startTime(resets: false);
                  }
                },
              ),
              const SizedBox(width: 10,),
              ButtonWidget(
                text: "Cancel",
                onClicked: stopTime,
              ),
            ],
          )
        : ButtonWidget(
            text: "Start Timer",
            color: const Color(0xFF000000),
            backgroundColor: const Color(0xFFFFFFFF),
            onClicked: () {startTime();},
          );
  }
}