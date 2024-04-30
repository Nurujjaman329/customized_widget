import 'package:flutter/material.dart';

class CheckBoxTest extends StatefulWidget {
  @override
  _CheckBoxTestState createState() => _CheckBoxTestState();
}

class _CheckBoxTestState extends State<CheckBoxTest> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              activeColor: Colors.red,
              focusColor: Colors.orange,
              value: this.value,
              onChanged: (bool? value) {
                setState(() {
                  this.value = value!;
                });
              },
            ),
            Text('Checkbox is checked '),
          ],
        ),
      ),
    );
  }
}
