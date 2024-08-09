import 'package:flutter/material.dart';
import 'package:week_usage_vis_flutter/widgets/swipe_text_widget.dart';

class SwipableTextWidget extends StatefulWidget {
  AnimationController controller;
  final leftCallback;
  final rightCallback;
  SwipableTextWidget(
      {required this.controller,
      required this.rightCallback,
      required this.leftCallback});

  @override
  State<SwipableTextWidget> createState() => _SwipableTextWidgetState();
}

class _SwipableTextWidgetState extends State<SwipableTextWidget> {
  String swipDirection = 'left';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SwipeTextWidget(direction: 'left', callback: () {
              swipDirection = 'left';
              widget.leftCallback();
            }),
        AnimatedBuilder(
          animation: widget.controller,
          builder: (context, child) {
            double value = widget.controller.value;
            return Opacity(
              opacity: 1 - value,
              child: Transform.translate(
                  offset: Offset(
                      (swipDirection == 'left' ? -1 : 1) * value * 250, 0),
                  child: child),
            );
          },
          child: Text(
            '2024-01-01 - 2024-01-08',
            style: TextStyle(color: Color(0xFFD6BD98), fontSize: 16.0),
          ),
        ),
        SwipeTextWidget(
            direction: 'right',
            callback: () {
              swipDirection = 'right';
              widget.rightCallback();
            })
      ],
    );
  }
}
