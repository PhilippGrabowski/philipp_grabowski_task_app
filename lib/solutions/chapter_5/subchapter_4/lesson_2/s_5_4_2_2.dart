import 'package:flutter/material.dart';

class S5422 extends StatefulWidget {
  const S5422({super.key});

  @override
  State<S5422> createState() => _S5422State();
}

class _S5422State extends State<S5422> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _checkInput() {
    try {
      int? age = int.tryParse(_controller.text);
      if (age == null) throw AgeException('Ungültige Eingabe');
      if (age <= 0 || age >= 100)
        throw AgeException('Alter muss zwischen 0 und 100 liegen');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        age.toString(),
        textAlign: TextAlign.center,
      )));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        e.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(height: 1.5),
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        width: 200,
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your age',
              fillColor: Colors.white,
              focusColor: Colors.orange[50]),
        ),
      ),
      const SizedBox(height: 16),
      TextButton(onPressed: _checkInput, child: Text('Parse Input'))
    ]);
  }
}

class AgeException implements Exception {
  final String message;

  AgeException(this.message);

  @override
  String toString() => message;
}
