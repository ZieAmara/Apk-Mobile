import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fonctionnalites/Minuterie/Screens/chrono.dart';
import 'package:fonctionnalites/theme.dart';

class Home extends StatelessWidget{
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: bgColor,
      body: const Chrono(),
    );
  }
}