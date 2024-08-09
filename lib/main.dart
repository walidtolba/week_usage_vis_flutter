import 'package:flutter/material.dart';
import 'package:week_usage_vis_flutter/pages/home_page.dart';

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
