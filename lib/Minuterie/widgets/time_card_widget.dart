import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fonctionnalites/theme.dart';

Widget timeCard({required String time, required String header}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: bordureCirculaire,
          child: Text(
            time,
            style: const TextStyle(
              fontSize: 72,
              color: Color(0xFF000000),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10,),
        Text(
          header,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
