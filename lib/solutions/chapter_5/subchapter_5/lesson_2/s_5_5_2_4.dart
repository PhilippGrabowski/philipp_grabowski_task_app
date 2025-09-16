import 'dart:math';

import 'package:flutter/material.dart';

class S5524 extends StatefulWidget {
  const S5524({super.key});

  @override
  State<S5524> createState() => _S5524State();
}

class _S5524State extends State<S5524> {
  final List<String> _diceResults = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    'Würfeln fehlgeschlagen'
  ];
  Future<int>? _diceFuture;

  Future<int> _getRollDiceResult() async {
    return await Future.delayed(const Duration(seconds: 2), () {
      final random = Random();
      int randomIndex = random.nextInt(7);
      return randomIndex;
    });
  }

  void _rollDice() {
    setState(() {
      _diceFuture = _getRollDiceResult();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        ElevatedButton(onPressed: _rollDice, child: Text('Würfeln')),
        const SizedBox(height: 16),
        if (_diceFuture != null)
          FutureBuilder(
              future: _getRollDiceResult(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Würfel wird geworfen...');
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  return Text(_diceResults[snapshot.data!]);
                }

                return Container();
              })
      ],
    ));
  }
}
