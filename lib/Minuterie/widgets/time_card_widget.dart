import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme_minuterie.dart';

Widget timeCard({required String time, required String header}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          header,
          style: const TextStyle(
            fontSize: 10,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5,),
        Container(
          padding: const EdgeInsets.all(6),
          decoration: bordureCirculaire,
          child: Text(
            time,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
