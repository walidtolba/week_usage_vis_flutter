
import 'package:flutter/material.dart';

class BarWidget extends StatelessWidget {
  final double percentage;
  final String weekDay;

  const BarWidget({required this.percentage, required this.weekDay});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 36,
          height: 20 + 180 * percentage,
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: Color(0xFFD6BD98),
              borderRadius: BorderRadius.circular(18)),
        ),
        Text(
          weekDay,
          style:
              TextStyle(color: Color(0xFFD6BD98), fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
