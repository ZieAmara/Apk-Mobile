import 'package:flutter/material.dart';

import '../Models/time_plus.dart';

class Chrono extends StatelessWidget{
  const Chrono({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Center(
      child: TimePlus(),
    );
  }
  
}