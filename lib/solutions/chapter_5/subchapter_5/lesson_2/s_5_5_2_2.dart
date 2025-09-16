import 'dart:math';

import 'package:flutter/material.dart';

class S5522 extends StatefulWidget {
  const S5522({super.key});

  @override
  State<S5522> createState() => _S5522State();
}

class _S5522State extends State<S5522> {
  final List<String> _diceResults = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    'Würfeln fehlgeschlagen'
  ];
  bool _diceIsRolling = false;
  int? _diceResult;

  Future<void> _rollDice() async {
    setState(() => _diceIsRolling = true);
    await Future.delayed(const Duration(seconds: 2), () {
      return Random().nextInt(7);
    }).then((onValue) {
      setState(() {
        _diceResult = onValue;
        _diceIsRolling = false;
      });
    }).catchError((onError) {
      setState(() {
        _diceResult = 6;
        _diceIsRolling = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        ElevatedButton(onPressed: _rollDice, child: Text('Würfeln')),
        const SizedBox(height: 16),
        if (_diceIsRolling) Text('Würfel wird geworfen...'),
        if (_diceResult != null && !_diceIsRolling)
          Text(_diceResults[_diceResult!])
      ],
    ));
  }
}
