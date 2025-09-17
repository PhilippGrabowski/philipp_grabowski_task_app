import 'package:flutter/material.dart';

class S5114 extends StatefulWidget {
  const S5114({super.key});

  @override
  State<S5114> createState() => _S5114State();
}

class _S5114State extends State<S5114> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animation = Tween<double>(begin: 20, end: 30)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return Text(
            'Hello, App Akademie!',
            style: TextStyle(fontSize: _animation.value),
          );
        },
      ),
    );
  }
}
