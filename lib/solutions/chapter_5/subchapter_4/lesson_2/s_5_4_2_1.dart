import 'package:flutter/material.dart';

enum Category { music, movie, art, sport, food }

class S5421 extends StatefulWidget {
  const S5421({super.key});

  @override
  State<S5421> createState() => _S5421State();
}

class _S5421State extends State<S5421> {
  List<Category> categories = [
    Category.art,
    Category.food,
    Category.movie,
    Category.music,
    Category.sport
  ];
  int? _enteredIndex;
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

  void _checkInput(String input) {
    int? number = int.tryParse(input);
    if (number == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Keine gültige Zahl')));
      setState(() {
        _enteredIndex = null;
      });
    } else if (number < 0 || number >= categories.length) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Index außerhalb des Bereichs')));
      setState(() {
        _enteredIndex = null;
      });
    } else {
      setState(() {
        _enteredIndex = number;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (context, index) => ListTile(
                      tileColor:
                          index == _enteredIndex ? Colors.blue : Colors.white,
                      title: Text(
                        categories[index].name.toUpperCase(),
                        style: TextStyle(
                            color: index != _enteredIndex
                                ? Colors.black
                                : Colors.white),
                      ),
                    )),
            const SizedBox(height: 16),
            TextField(
              onChanged: (value) => _checkInput(value),
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Index',
                fillColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
