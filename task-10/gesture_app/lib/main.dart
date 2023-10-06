import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  late Color _color;
  late double _top;
  late double _left;
  late final AnimationController _controller;
  late final Animation<double> _animation;
  final MediaQueryData dataSizes = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.single);
  // Sizes for container to calculate later the X and Y coordinates
  final double containerHeigh = 200;
  final double containerWidth = 200;

  @override
  void initState() {
    super.initState();
    _color = Colors.amber;

    final double width = dataSizes.size.width;
    final double height = dataSizes.size.height;
    // Calculate the inistal center coordinates
    _top = (height - containerHeigh) / 2;
    _left = (width - containerWidth) / 2;

    // Controller init
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Animation init
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Change position
  void onDragStart(DragStartDetails detailes) {
    setState(() {
      // Assign top/left positions
      _top = detailes.localPosition.dy;
      _left = detailes.localPosition.dx;
    });
  }

  // Change color
  void onTap() {
    setState(() {
      _color = _color == Colors.black ? Colors.amber : Colors.black;
    });
  }

  // Rotating
  void onLongPress() {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          top: _top,
          left: _left,
          child: Center(
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: RotationTransition(
                turns: _animation,
                child: Container(
                  width: containerHeigh,
                  height: containerWidth,
                  color: _color,
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: GestureDetector(
            onVerticalDragStart: onDragStart,
            onTap: onTap,
            onLongPress: onLongPress,
          ),
        ),
      ],
    ));
  }
}
