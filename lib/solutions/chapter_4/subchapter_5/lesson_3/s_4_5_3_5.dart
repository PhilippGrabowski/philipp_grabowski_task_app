import 'package:flutter/material.dart';

class S4535 extends StatelessWidget {
  const S4535({super.key});
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];

    return Column(
      children: List.generate(
        2,
        (x) => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                2,
                (y) => Container(
                      width: 100,
                      height: 100,
                      color: colors[x == 0 ? y : 2 + y],
                    ))),
      ),
    );
  }
}
