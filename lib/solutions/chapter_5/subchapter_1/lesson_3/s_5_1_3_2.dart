import 'package:flutter/material.dart';

class S5132 extends StatefulWidget {
  const S5132({super.key});

  @override
  State<S5132> createState() => _S5132State();
}

class _S5132State extends State<S5132> {
  TextOverflow _overflow = TextOverflow.fade;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 200,
          height: 30,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  _overflow = TextOverflow.visible;
                });
              },
              child: Text(
                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l',
                style: TextStyle(overflow: _overflow),
              ))),
    );
  }
}
