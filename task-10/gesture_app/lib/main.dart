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
  late double _bottom;
  late double _right;
  bool _selected = false;
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _color = Colors.amber;
    _top = 0;
    _left = 0;

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
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            Positioned(
              top: _top,
              left: _left,
              child: Center(
                child: AnimatedContainer(
                  alignment: _selected
                      ? Alignment.topCenter
                      : AlignmentDirectional.center,
                  duration: const Duration(seconds: 2),
                  curve: Curves.fastOutSlowIn,
                  child: RotationTransition(
                      turns: _animation,
                      child: Container(width: 200, height: 200, color: _color)),
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
