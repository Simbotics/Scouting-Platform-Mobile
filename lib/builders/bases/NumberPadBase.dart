// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/styles/AppStyle.dart';

class NumberPadBase extends StatefulWidget {
  final Function(String) onNumberPressed;
  final Function() onDelete;
  final Function() onSubmitScore;
  final Function() onSubmitPass;
  final bool showPassButton;

  const NumberPadBase(
      {super.key,
      required this.onNumberPressed,
      required this.onDelete,
      required this.onSubmitScore,
      required this.onSubmitPass,
      required this.showPassButton});

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
          children: [
            _buildNumberButton("1"),
            _buildNumberButton("2"),
            _buildNumberButton("3")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberButton("4"),
            _buildNumberButton("5"),
            _buildNumberButton("6")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberButton("7"),
            _buildNumberButton("8"),
            _buildNumberButton("9")
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildIconButton(Icons.backspace, widget.onDelete),
            _buildNumberButton("0"),
            _buildTextButton("SCR", widget.onSubmitScore),
            if (widget.showPassButton)
              _buildTextButton("PSS", widget.onSubmitPass)
          ],
        ),
      ],
    );
  }

  Widget _buildNumberButton(String number) {
    return SizedBox(
      width: 60,
      height: 60,
      child: ElevatedButton(
          onPressed: () => widget.onNumberPressed(number),
          style: ElevatedButton.styleFrom(
              backgroundColor: AppStyle.accent,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          child: Text(
            number,
            style: const TextStyle(color: Colors.white, fontSize: 28),
          )),
    );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return SizedBox(
      height: 60,
      width: 60,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppStyle.accent,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          child: Icon(
            icon,
            color: Colors.white,
            size: 26,
          )),
    );
  }

  Widget _buildTextButton(String text, VoidCallback onPressed) {
    return SizedBox(
      height: 60,
      width: 60,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppStyle.accent,
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          )),
    );
  }
}
