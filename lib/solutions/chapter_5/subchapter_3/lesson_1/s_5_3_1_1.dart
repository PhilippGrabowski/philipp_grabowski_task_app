import 'package:flutter/material.dart';

class S5311 extends StatelessWidget {
  const S5311({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 200,
        child: Image.asset(
          'assets/images/tropical-beach-scene.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
