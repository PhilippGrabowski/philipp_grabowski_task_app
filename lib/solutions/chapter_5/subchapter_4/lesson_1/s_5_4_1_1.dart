import 'package:flutter/material.dart';

class S5411 extends StatelessWidget {
  const S5411({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            try {
              throw Exception('Es gab einen Fehler!');
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(e.toString())));
            }
          },
          child: Text('Throw Error')),
    );
  }
}
