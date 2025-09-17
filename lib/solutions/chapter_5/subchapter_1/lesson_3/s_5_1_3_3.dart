import 'package:flutter/material.dart';

class S5133 extends StatelessWidget {
  const S5133({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(8),
        alignment: Alignment.center,
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.blueGrey,
            boxShadow: [
              BoxShadow(
                  blurRadius: 6,
                  spreadRadius: 4,
                  color: const Color.fromARGB(67, 18, 40, 47))
            ]),
        child: Text(
          'Box Example',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
