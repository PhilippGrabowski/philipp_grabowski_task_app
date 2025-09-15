import 'package:flutter/material.dart';

class S4523 extends StatelessWidget {
  const S4523({super.key});
  @override
  Widget build(BuildContext context) {
    return MyNameWidget();
  }
}

class MyNameWidget extends StatefulWidget {
  const MyNameWidget({super.key});

  @override
  State<MyNameWidget> createState() => _MyNameWidgetState();
}

class _MyNameWidgetState extends State<MyNameWidget> {
  bool btnWasClicked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(btnWasClicked ? 'Philipp' : ''),
        ElevatedButton(
            onPressed: () {
              setState(() {
                btnWasClicked = true;
              });
            },
            child: Text('Name anzeigen'))
      ],
    );
  }
}
