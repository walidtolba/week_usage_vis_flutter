import 'package:flutter/material.dart';

class SwipeTextWidget extends StatelessWidget {
  final GestureTapCallback callback;
  final String direction;
  SwipeTextWidget({required this.callback, required this.direction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Padding(
        padding: EdgeInsets.fromLTRB((direction == 'right' ? 30 : 0), 30,
            (direction == 'left' ? 30 : 0), 30),
        child: Text(
          (direction == 'left') ? '<' : '>',
          style: TextStyle(color: Color(0xFFD6BD98), fontSize: 16.0),
        ),
      ),
    );
  }
}
