import 'package:flutter/material.dart';

class S4524 extends StatelessWidget {
  const S4524({super.key});
  @override
  Widget build(BuildContext context) {
    return ShowHideNameWidget();
  }
}

class ShowHideNameWidget extends StatefulWidget {
  const ShowHideNameWidget({super.key});

  @override
  State<ShowHideNameWidget> createState() => _ShowHideNameWidgetState();
}

class _ShowHideNameWidgetState extends State<ShowHideNameWidget> {
  bool hideName = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(hideName ? '' : 'Philipp'),
        ElevatedButton(
            onPressed: () {
              setState(() {
                hideName = !hideName;
              });
            },
            child: Text(hideName ? 'Name anzeigen' : 'Name verstecken'))
      ],
    );
  }
}
