import 'package:flutter/material.dart';

class S5111 extends StatelessWidget {
  const S5111({super.key});
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Colors.red, Colors.green];

    return Column(
      spacing: 60,
      children: [
        Text(
          'Hello World!',
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 40,
          children: List.generate(
            colors.length,
            (index) => Container(
              width: 100,
              height: 100,
              color: colors[index],
            ),
          ),
        ),
        Switch(
          activeThumbColor: Colors.orange,
          value: true,
          onChanged: (b) {},
        )
      ],
    );
  }
}
