import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String buttonName;
  const CustomButton({super.key, required this.buttonName});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .07,
      width: MediaQuery.of(context).size.width * .80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        color: Colors.blue,
      ),
      child: Center(
        child: Text(
          widget.buttonName,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
