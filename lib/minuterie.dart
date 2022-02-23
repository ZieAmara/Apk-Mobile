import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fonctionnalites/widgets/button_widget.dart';

class Minuterie extends StatefulWidget{
  final String title="Minuterie";

  const Minuterie({Key? key,}) : super(key: key);

  @override
  State<Minuterie> createState() => _MinuterieState();
}

class _MinuterieState extends State<Minuterie> {
  final Stream<QuerySnapshot> _matchStream =
      FirebaseFirestore.instance.collection("matchs").snapshots();

  String text = "Minuterie";
  static const maxTime = 10;
  int seuil = maxTime;
  Timer? timer;

  void startTime(){
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seuil>0){
        setState(() => seuil--);
      }else{stopTimer(reset: false);}
    });
  }
  void resetTimer() => setState(() => seuil = maxTime);
  void stopTimer({bool reset = true}){
    if (reset){
      resetTimer();
    }
    timer?.cancel();
  }


  @override
  Widget build(BuildContext context) {

    Widget buildButtons(){
      final isRunning = timer == null ? false : timer!.isActive;
      return isRunning
          ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWidget(
                    text: "pause",
                    onClicked: ()=>stopTimer()
                ),
              const SizedBox(width: 10,),
              ButtonWidget(
                  text: "reset",
                  onClicked: stopTimer
              )
            ],
          )
          : ButtonWidget(
        txtColors: Colors.white,
        bgColors: Colors.deepPurple,
        text:'Start',
        onClicked:()=>startTime(),
      );
    }
    Widget buildTime(){
      return Text(
        "$seuil'",
        style: const TextStyle(fontSize: 50),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildTime(),
            const SizedBox(height: 80,),
            buildButtons(),
          ],
        ),
      ),
    );
  }
}