import 'package:flutter/material.dart';

class S5511 extends StatefulWidget {
  const S5511({super.key});

  @override
  State<S5511> createState() => _S5511State();
}

class _S5511State extends State<S5511> {
  int _counter1 = 0;
  int _counter2 = 0;

  Future<void> _methode1() async {
    await warteKurz();
    return Future(() {
      setState(() {
        ++_counter1;
      });
      print('_methode1');
    });
  }

  Future<void> _methode2() async {
    await warteKurz();
    return Future(() {
      setState(() {
        ++_counter2;
      });
      print('_methode2');
    });
  }

  Future<void> onBtn() async {
    await _methode1();
    await _methode2();
    print('Fertig');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: onBtn, child: Text('Print')),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 50,
          children: [
            Text('$_counter1'),
            Text('$_counter2'),
          ],
        )
      ],
    );
  }

  // ignoriere für den Moment den Inhalt dieser Methode
  Future<void> warteKurz() {
    return Future.delayed(const Duration(milliseconds: 500));
  }
}
