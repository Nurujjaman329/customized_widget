import 'package:flutter/material.dart';

class SliderTestWidget extends StatefulWidget {
  @override
  _SliderTestWidgetState createState() => _SliderTestWidgetState();
}

class _SliderTestWidgetState extends State<SliderTestWidget> {
  double _sliderValue = 0.0;

  void _handleSliderValueChange(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Slider Value: $_sliderValue'),
          Slider(
            value: _sliderValue,
            min: 0.0,
            max: 100.0,
            divisions: 10,
            label: '$_sliderValue',
            onChanged: _handleSliderValueChange,
          ),
        ],
      ),
    );
  }
}
