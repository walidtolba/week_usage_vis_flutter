import 'package:flutter/material.dart';

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
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
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
          children: [Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
            BarWidget(),BarWidget(),BarWidget(),BarWidget(),BarWidget(),BarWidget(),BarWidget()
          ],)],
        ),
      ),
    );
  }
}

class BarWidget extends StatelessWidget {
  const BarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36,
      height: 200,
      margin: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Color(0xFFD6BD98),
        borderRadius: BorderRadius.circular(18)
      ),
    );
  }
}