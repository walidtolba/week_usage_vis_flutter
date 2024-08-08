import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weekly Visualization',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static const List<String> weekDays = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat'
  ];

  late AnimationController _controller;
  late List<double> week;
  late List<double> nextWeek;

  @override
  void initState() {
    week = [0.7, 0.4, 0.3, 0.5, 0.7, 1, 0.8];
    nextWeek = week;

    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed){
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < 7; i++)
                  BarWidget(
                    percentage:
                        week[i] - (week[i] - nextWeek[i]) * _controller.value,
                    weekDay: weekDays[i],
                  )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '< ',
                  style: TextStyle(color: Color(0xFFD6BD98), fontSize: 16.0),
                ),
                GestureDetector(
                  child: Text(
                    '2024-01-01 - 2024-01-08',
                    style: TextStyle(color: Color(0xFFD6BD98), fontSize: 16.0),
                  ),
                  onTap: () {
                    nextWeek =
                        List.generate(7, (index) => Random().nextDouble());
                        print(_controller.value);
                    _controller.forward();
                  },
                ),
                Text(
                  '>',
                  style: TextStyle(color: Color(0xFFD6BD98), fontSize: 16.0),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BarWidget extends StatelessWidget {
  final double percentage;
  final String weekDay;

  const BarWidget({required this.percentage, required this.weekDay});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
