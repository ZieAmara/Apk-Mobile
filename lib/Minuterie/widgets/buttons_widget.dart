import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget{

  final String text;
  final VoidCallback onClicked;
  final Color backgroundColor;
  final Color color;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    this.backgroundColor = Colors.deepPurple,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7)
        ),
        onPressed: onClicked,
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: color
          ),
        )
    );
  }
}
