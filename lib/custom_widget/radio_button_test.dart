import 'package:flutter/material.dart';

class RadioButtonTest extends StatefulWidget {
  final String radioButtonName;
  const RadioButtonTest({super.key, required this.radioButtonName});
  @override
  _RadioButtonTestState createState() => _RadioButtonTestState();
}

class _RadioButtonTestState extends State<RadioButtonTest> {
  String selectedOption = '';

  //_handleRadioValueChange(String value) {
  //  setState(() {
  //    _selectedOption = value;
  //  });
  //}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = 'Radio';
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * .80,
          padding: EdgeInsets.all(6.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: selectedOption == 'Radio'
                  ? Color(0XFFE1136E)
                  : Colors.blueAccent,
              width: selectedOption == 'Radio' ? 2.0 : 0.5,
            ),
          ),
          child: RadioListTile(
            activeColor: Colors.black,
            title: Padding(
              padding: EdgeInsets.only(right: 100.0),
              child: Text(widget.radioButtonName),
            ),
            value: 'Radio',
            groupValue: selectedOption,
            onChanged: (value) {
              setState(() {
                selectedOption = value.toString();
              });
            },
          ),
        ),
      ),
    );

    //Column(
    //  mainAxisAlignment: MainAxisAlignment.center,
    //  children: <Widget>[
    //    RadioListTile(
    //      title: Text('Option 1'),
    //      value: 'option1',
    //      groupValue: _selectedOption,
    //      onChanged: _handleRadioValueChange(''),
    //    ),
    //    RadioListTile(
    //      title: Text('Option 2'),
    //      value: 'option2',
    //      groupValue: _selectedOption,
    //      onChanged: _handleRadioValueChange(''),
    //    ),
    //    RadioListTile(
    //      title: Text('Option 3'),
    //      value: 'option3',
    //      groupValue: _selectedOption,
    //      onChanged: _handleRadioValueChange(''),
    //    ),
    //  ],
    //);
  }
}
