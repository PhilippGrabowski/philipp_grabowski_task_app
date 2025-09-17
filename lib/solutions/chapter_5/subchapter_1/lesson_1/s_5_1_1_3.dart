import 'package:flutter/material.dart';

class S5113 extends StatelessWidget {
  const S5113({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomMaterialButton(),
    );
  }
}

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 2, color: Colors.green),
            color: const Color.fromARGB(121, 171, 236, 97)),
        child: Text(
          'Click Me',
          style: TextStyle(color: const Color.fromARGB(255, 11, 74, 13)),
        ),
      ),
    );
  }
}
