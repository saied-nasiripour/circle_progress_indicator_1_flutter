import 'package:circle_progress_indicator_1_flutter/circle_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  final maxProgress = 100.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 3000));
    _animation =
        Tween<double>(begin: 0, end: maxProgress).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Circle Progress Indicator")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                foregroundPainter: CircleProgress(
                  _animation.value,
                  CupertinoColors.black,
                  CupertinoColors.systemPurple,
                    -pi/2,
                ),
                child: Container(
                  width: 300,
                  height: 300,
                  /*color: CupertinoColors.activeBlue,*/
                  child: GestureDetector(
                    onTap: () {
                      if (_animation.value == maxProgress) {
                        _animationController.reverse();
                      } else {
                        _animationController.forward();
                      }
                    },
                    child: Center(
                      child: Text('${_animation.value.toInt()}',
                          style: const TextStyle(fontSize: 50)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Text("Tap on the number inside the circle",
              style: TextStyle(fontSize: 20)),
        ],
      ),
    ));
  }
}
