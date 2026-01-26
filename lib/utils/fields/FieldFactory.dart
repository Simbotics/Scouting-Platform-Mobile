// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/builders/bases/NumberPadBase.dart';
import 'package:scouting_platform/builders/bases/StopwatchButton.dart';
import 'package:scouting_platform/builders/bases/PlatformDropdownMenu.dart';
import 'package:scouting_platform/builders/bases/CounterNumberField.dart';
import 'package:scouting_platform/builders/bases/NumberInputField.dart';
import 'package:scouting_platform/builders/bases/TextInputField.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'FieldDescriptor.dart';

class FieldFactory {
  static Widget build(FieldDescriptor descriptor, {BuildContext? context}) {
    switch (descriptor.type) {
      case FieldType.numberPad:
        return NumberPadField(
          displayedController: descriptor.config['displayedController'],
          targetController: descriptor.config['targetController'],
          targetControllerPass: descriptor.config['targetControllerPass'],
          showPassButton: descriptor.config['showPassButton'] ?? false,
        );

      case FieldType.stopwatch:
        return StopwatchButton(
          value: descriptor.config['value'],
          timer: descriptor.config['timer'],
        );

      case FieldType.dropdown:
        return DropdownField(
          controller: descriptor.config['controller'],
          dropdownItems: descriptor.config['dropdownItems'],
          margin: descriptor.config['margin'],
        );

      case FieldType.counter:
        return CounterField(controller: descriptor.config['controller']);

      case FieldType.numberInput:
        // Allow the 'readOnly' config to be a bool or a callable that returns a bool.
        var rawReadOnly = descriptor.config['readOnly'];
        bool readOnlyValue = false;
        if (rawReadOnly is bool) {
          readOnlyValue = rawReadOnly;
        } else if (rawReadOnly is Function) {
          try {
            readOnlyValue = rawReadOnly();
          } catch (_) {
            readOnlyValue = false;
          }
        }

        return NumberInputField(
          controller: descriptor.config['controller'],
          onChanged: descriptor.config['onChanged'] ?? (v) {},
          hintText: descriptor.config['hintText'] ?? '',
          readOnly: readOnlyValue,
          margin: descriptor.config['margin'] ?? const EdgeInsets.only(top: 4.0, left: 10.0),
          width: descriptor.config['width'] ?? 150.0,
        );

      case FieldType.textField:
        return TextInputField(
          controller: descriptor.config['controller'],
          hintText: descriptor.config['hintText'] ?? '',
          onChanged: descriptor.config['onChanged'] ?? (v) {},
          textAlign: descriptor.config['textAlign'] ?? TextAlign.left,
          margin: descriptor.config['margin'] ?? const EdgeInsets.only(top: 0.0),
          width: descriptor.config['width'] ?? 150.0,
          height: descriptor.config['height'] ?? 47.5,
        );

      case FieldType.label:
        return LabelField(
          labels: List<String>.from(descriptor.config['labels'] ?? []),
          buttonLabel: descriptor.config['buttonLabel'],
          routeBuilder: descriptor.config['routeBuilder'],
        );

      default:
        return SizedBox.shrink();
    }
  }
}

class NumberPadField extends StatefulWidget {
  final TextEditingController displayedController;
  final TextEditingController targetController;
  final TextEditingController? targetControllerPass;
  final bool showPassButton;

  const NumberPadField({
    super.key,
    required this.displayedController,
    required this.targetController,
    this.targetControllerPass,
    this.showPassButton = false,
  });

  @override
  State<NumberPadField> createState() => _NumberPadFieldState();
}

class _NumberPadFieldState extends State<NumberPadField> {
  void onNumberPressed(String number) {
    if (!mounted) return;
    setState(() {
      widget.displayedController.text += number;
    });
  }

  void onDeletePressed() {
    if (!mounted) return;
    setState(() {
      widget.displayedController.text = "";
    });
  }

  void onSubmitScorePressed() {
    if (!mounted) return;
    setState(() {
      try {
        int addingValue = int.parse(widget.displayedController.text);
        int currentValue = int.parse(widget.targetController.text);
        int finalValue = addingValue + currentValue;
        widget.displayedController.text = "";
        widget.targetController.text = finalValue.toString();
      } catch (e) {
        widget.displayedController.text = "";
      }
    });
  }

  void onSubmitPassPressed() {
    if (!mounted) return;
    if (widget.targetControllerPass == null) return;
    setState(() {
      try {
        int addingValue = int.parse(widget.displayedController.text);
        int currentValue = int.parse(widget.targetControllerPass!.text);
        int finalValue = addingValue + currentValue;
        widget.displayedController.text = "";
        widget.targetControllerPass!.text = finalValue.toString();
      } catch (e) {
        widget.displayedController.text = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
            child: SizedBox(
          height: 50,
          width: 200,
          child: TextField(
            textAlign: TextAlign.center,
            controller: widget.displayedController,
            readOnly: true,
            style: TextStyle(fontSize: 20, color: Colors.white),
            decoration: InputDecoration(
                fillColor: AppStyle.textInputColor,
                filled: true,
                border: OutlineInputBorder(),
                hintText: "Input Number",
                hintStyle: TextStyle(color: AppStyle.textInputColorLight)),
          ),
        )),
        SizedBox(
          height: 20,
        ),
        Center(
          child: NumberPadBase(
            showPassButton: widget.showPassButton,
            onNumberPressed: onNumberPressed,
            onDelete: onDeletePressed,
            onSubmitScore: onSubmitScorePressed,
            onSubmitPass: onSubmitPassPressed,
          ),
        )
      ],
    );
  }
}

class DropdownField extends StatefulWidget {
  final TextEditingController controller;
  final List<String> dropdownItems;
  final EdgeInsets? margin;

  const DropdownField({super.key, required this.controller, required this.dropdownItems, this.margin});

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  @override
  Widget build(BuildContext context) {
    return PlatformDropdownMenu(
      dropdownMenuSelectedItem: widget.controller.text,
      onChanged: (value) {
        setState(() {
          widget.controller.text = value;
        });
      },
      dropdownItems: widget.dropdownItems,
      margin: widget.margin ?? const EdgeInsets.only(left: 20),
    );
  }
}

class CounterField extends StatefulWidget {
  final TextEditingController controller;

  const CounterField({super.key, required this.controller});

  @override
  State<CounterField> createState() => _CounterFieldState();
}

class _CounterFieldState extends State<CounterField> {
  void incrementNumber() {
    if (!mounted) return;
    int currentValue = int.tryParse(widget.controller.text) ?? 0;
    setState(() {
      currentValue++;
      widget.controller.text = currentValue.toString();
    });
  }

  void decrementNumber() {
    if (!mounted) return;
    int currentValue = int.tryParse(widget.controller.text) ?? 0;
    setState(() {
      currentValue--;
      widget.controller.text = (currentValue > 0 ? currentValue : 0).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CounterNumberField(
      controller: widget.controller,
      onTapDecrement: decrementNumber,
      onTapIncrement: incrementNumber,
    );
  }
}

class LabelField extends StatelessWidget {
  final List<String> labels;
  final String? buttonLabel;
  final Widget Function()? routeBuilder;

  const LabelField({super.key, required this.labels, this.buttonLabel, this.routeBuilder});

  @override
  Widget build(BuildContext context) {
    // Simple layout: render labels in a row then optional button on right
    List<Widget> children = [];
    for (var label in labels) {
      children.add(Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 170.0,
          padding: const EdgeInsets.only(left: 20.0, top: 20.0, right: 5.0),
          child: Text(
            label,
            textAlign: TextAlign.left,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
        ),
      ));
    }

    children.add(const SizedBox(width: 270.0));

    if (buttonLabel != null && routeBuilder != null) {
      children.add(Container(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(150.0, 37.0),
            padding: const EdgeInsets.all(15),
          ),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => routeBuilder!()));
          },
          child: Text(buttonLabel!, style: const TextStyle(fontSize: 16.0, color: Colors.white)),
        ),
      ));
    }

    return Row(children: children);
  }
}
