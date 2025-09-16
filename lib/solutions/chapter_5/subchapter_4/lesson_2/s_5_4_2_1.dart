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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (context, index) => Text('Hallo')),
          ),
          const SizedBox(height: 16),
          // TextField(
          //   controller: _controller,
          //   decoration: InputDecoration(
          //     border: OutlineInputBorder(),
          //     labelText: 'Enter Index',
          //     fillColor: Colors.white,
          //   ),
          // )
        ],
      ),
    );
  }
}
