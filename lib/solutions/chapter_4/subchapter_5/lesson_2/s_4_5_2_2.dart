import 'package:flutter/material.dart';

class S4522 extends StatelessWidget {
  const S4522({super.key});
  final String name = 'Philipp';

  @override
  Widget build(BuildContext context) {
    return MyStatelessWidget(name: name);
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Hello $name'),
        ElevatedButton(onPressed: () {}, child: Text('Klick mich'))
      ],
    );
  }
}
