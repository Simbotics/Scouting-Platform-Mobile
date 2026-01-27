// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:scouting_platform/styles/AppStyle.dart';
import 'FieldDescriptor.dart';
import 'FieldFactory.dart';

/// example:
/// FieldRow.fields([descriptorA, descriptorB], spacing: 20)
class FieldRow extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment alignment;

  const FieldRow._(this.children, {this.alignment = MainAxisAlignment.start, super.key});

  factory FieldRow.widgets(List<Widget> widgets, {MainAxisAlignment alignment = MainAxisAlignment.start}) {
    return FieldRow._(widgets, alignment: alignment);
  }

  factory FieldRow.fields(List<FieldDescriptor> descriptors, {MainAxisAlignment alignment = MainAxisAlignment.start}) {
    final widgets = descriptors.map<Widget>((d) {
      final rawFlex = d.config['flex'];
      final int flex = (rawFlex is int) ? rawFlex : 1;
      return Flexible(
        flex: flex,
        fit: FlexFit.loose,
        child: Container(
          padding: const EdgeInsets.only(left: 0, top: 12.0, right: 8.0),
          alignment: Alignment.centerLeft,
          child: FieldFactory.build(d),
        ),
      );
    }).toList();

    return FieldRow._(widgets, alignment: alignment);
  }

  factory FieldRow.labels(
    List<String> labels, {
    double leftPadding = 20.0,
    MainAxisAlignment alignment = MainAxisAlignment.start,
    String? buttonLabel,
    Widget Function()? routeBuilder,
    int labelFlex = 1,
  }) {
    final List<Widget> widgets = labels.map<Widget>((t) {
      return Flexible(
        flex: labelFlex,
        fit: FlexFit.tight,
        child: Container(
          padding: EdgeInsets.only(left: leftPadding, top: 12.0, right: 5.0),
          alignment: Alignment.centerLeft,
          child: Text(
            t,
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0),
          ),
        ),
      );
    }).toList();

    if (buttonLabel != null && routeBuilder != null) {
      widgets.add(const Spacer());
      widgets.add(Builder(builder: (context) {
        return Container(
          padding: const EdgeInsets.all(5.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(150.0, 37.0),
              padding: const EdgeInsets.all(15),
              backgroundColor: AppStyle.textInputColor,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => routeBuilder()));
            },
            child: Text(buttonLabel, style: const TextStyle(fontSize: 16.0, color: Colors.white)),
          ),
        );
      }));
    }

    return FieldRow._(widgets, alignment: alignment);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: children,
    );
  }
}
