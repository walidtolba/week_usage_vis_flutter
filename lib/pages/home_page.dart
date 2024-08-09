import 'dart:math';

import 'package:flutter/material.dart';
import 'package:week_usage_vis_flutter/constants.dart';
import 'package:week_usage_vis_flutter/widgets/bar_widget.dart';
import 'package:week_usage_vis_flutter/widgets/swipable_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<double> week;
  late List<double> nextWeek;

  void generateRandomWeek() {
    week = nextWeek;
    nextWeek = List.generate(7, (index) => Random().nextDouble());
  }

  @override
  void initState() {
    week = kInitWeek;
    nextWeek = List.from(week);

    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        week = nextWeek;
        _controller.reset();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A3636),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 240,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (var i = 0; i < 7; i++)
                    BarWidget(
                      percentage:
                          week[i] + (nextWeek[i] - week[i]) * _controller.value,
                      weekDay: kWeekDays[i],
                    )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SwipableTextWidget(
                controller: _controller,
                rightCallback: () {
                  generateRandomWeek();
                  _controller.forward();
                },
                leftCallback: () {
                  generateRandomWeek();
                  _controller.forward();
                })
          ],
        ),
      ),
    );
  }
}

