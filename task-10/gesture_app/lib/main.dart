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
  late Color color;
  late double top;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    color = Colors.amber;
    top = 0;
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
              top: top,
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(
                  child: AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return Transform.rotate(
                    angle: _controller.value,
                    child: Container(width: 200, height: 200, color: color),
                  );
                },
              )),
            ),
            Positioned.fill(
              child: GestureDetector(
                onVerticalDragStart: (details) {
                  setState(() {
                    top = details.globalPosition.dy.abs();
                  });
                },
                onVerticalDragEnd: (details) {
                  setState(() {
                    top = 0;
                  });
                },
                onTap: () {
                  setState(() {
                    color = color == Colors.black ? Colors.amber : Colors.black;
                  });
                },
                onLongPress: () {
                  setState(() {
                    if (_controller.isAnimating) {
                      _controller.stop();
                    } else {
                      _controller.repeat();
                    }
                  });
                },
              ),
            ),
          ],
        ));
  }
}
