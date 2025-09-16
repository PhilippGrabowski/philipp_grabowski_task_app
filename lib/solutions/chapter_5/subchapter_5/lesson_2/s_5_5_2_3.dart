import 'dart:math';

import 'package:flutter/material.dart';

class S5523 extends StatefulWidget {
  const S5523({super.key});

  @override
  State<S5523> createState() => _S5523State();
}

class _S5523State extends State<S5523> {
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
    try {
      setState(() => _diceIsRolling = true);
      await Future.delayed(const Duration(seconds: 2));
      final randomIndex = Random().nextInt(7);
      setState(() {
        _diceResult = randomIndex;
        _diceIsRolling = false;
      });
    } catch (e) {
      setState(() {
        _diceResult = 6;
        _diceIsRolling = false;
      });
    }
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
