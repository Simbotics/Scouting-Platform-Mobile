// ignore_for_file: file_names
import 'package:flutter/material.dart';

class NumberPadBase extends StatefulWidget {
  final Function(String) onNumberPressed;
  final Function() onDelete;
  final Function() onSubmit;

  const NumberPadBase({
    super.key,
    required this.onNumberPressed,
    required this.onDelete,
    required this.onSubmit,
  });

  @override
  State<NumberPadBase> createState() => _NumberPadBaseState();
}

class _NumberPadBaseState extends State<NumberPadBase> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_buildButton("1"), _buildButton("2"), _buildButton("3")],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_buildButton("4"), _buildButton("5"), _buildButton("6")],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [_buildButton("7"), _buildButton("8"), _buildButton("9")],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIcon(Icons.backspace, widget.onDelete),
            _buildButton("0"),
            _buildIcon(Icons.check, widget.onSubmit)
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String number) {
    return SizedBox(
      width: 60,
      height: 60,
      child: ElevatedButton(
          onPressed: () => widget.onNumberPressed(
                number,
              ),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Text(
            number,
            style: TextStyle(color: Colors.black, fontSize: 30),
          )),
    );
  }

  Widget _buildIcon(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      height: 60,
      width: 60,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Icon(
            icon,
            color: Colors.black,
            size: 30,
          )),
    );
  }
}
