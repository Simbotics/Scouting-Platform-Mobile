import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberInputFieldWithCounter extends StatefulWidget {
  final TextEditingController controller;
  final Function onTapIncrement;
  final Function onTapDecrement;

  const NumberInputFieldWithCounter({
    Key? key,
    required this.controller,
    required this.onTapIncrement,
    required this.onTapDecrement,
  }) : super(key: key);

  @override
  _NumberInputFieldWithCounterState createState() =>
      _NumberInputFieldWithCounterState();
}

class _NumberInputFieldWithCounterState
    extends State<NumberInputFieldWithCounter> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 47,
      padding: const EdgeInsets.all(3),
      //margin: const EdgeInsets.only(left: 10.0),
      decoration: const BoxDecoration(color: AppStyle.textInputColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
              onTap: () {
                widget.onTapDecrement.call();
              },
              child: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 25,
              )),
          Expanded(
              child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 3),
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: AppStyle.textInputColor),
            child: TextFormField(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14.0,
              ),
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                filled: true,
                fillColor: AppStyle.textInputColor,
                contentPadding: EdgeInsets.all(8.0),
              ),
              controller: widget.controller,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: false,
                signed: true,
              ),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
            ),
          )),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      widget.onTapIncrement.call();
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 25,
                    )),
              ]),
        ],
      ),
    );
  }
}
