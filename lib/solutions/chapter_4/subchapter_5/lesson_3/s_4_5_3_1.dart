import 'package:flutter/material.dart';

class S4531 extends StatelessWidget {
  const S4531({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [Colors.blueGrey, Colors.blue, Colors.cyan];

    return Column(
      children: List.generate(
          colors.length,
          (index) => Container(
                width: 100,
                height: 100,
                color: colors[index],
              )),
    );
  }
}
