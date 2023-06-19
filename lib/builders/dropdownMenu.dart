// ignore_for_file: file_names
import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';

class ScoutingDropdownMenu extends StatefulWidget {
  final EdgeInsetsGeometry margin;
  final double width;
  final Color dropdownButtonColor;
  final Color dropdownMenuColor;
  final String dropdownMenuSelectedItem;
  final Function onChanged;
  final List<String> dropdownItems;
  final Color selectedItemTextColor;
  final EdgeInsetsGeometry selectedItemTextPadding;
  final AlignmentGeometry selectedItemAlignment;
  final double selectedItemFontSize;

  const ScoutingDropdownMenu({
    Key? key,
    this.margin = const EdgeInsets.only(top: 0.0),
    this.width = 204.0,
    this.dropdownButtonColor = AppStyle.textInputColor,
    this.dropdownMenuColor = Colors.white,
    required this.dropdownMenuSelectedItem,
    required this.onChanged,
    required this.dropdownItems,
    this.selectedItemTextColor = Colors.white,
    this.selectedItemTextPadding = const EdgeInsets.all(10.0),
    this.selectedItemAlignment = Alignment.centerLeft,
    this.selectedItemFontSize = 14.0,
  }) : super(key: key);

  @override
  State<ScoutingDropdownMenu> createState() => _ScoutingDropdownMenuState();
}

class _ScoutingDropdownMenuState extends State<ScoutingDropdownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      width: widget.width,
      height: 47.0,
      decoration: BoxDecoration(
        color: widget.dropdownButtonColor,
      ),
      child: DropdownButton<String>(
        isExpanded: false,
        underline: const SizedBox(),
        dropdownColor: widget.dropdownMenuColor,
        value: widget.dropdownMenuSelectedItem,
        onChanged: (String? newValue) {
          widget.onChanged(newValue);
        },

        // Style the selected item
        selectedItemBuilder: (BuildContext context) {
          return widget.dropdownItems.map((String value) {
            return Container(
                padding: widget.selectedItemTextPadding,
                alignment: widget.selectedItemAlignment,
                width: 100,
                child: Text(
                  value,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: widget.selectedItemTextColor,
                      fontSize: widget.selectedItemFontSize),
                ));
          }).toList();
        },

        // Style items in the menu
        items:
            widget.dropdownItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Align(alignment: Alignment.center, child: Text(value)),
          );
        }).toList(),
      ),
    );
  }
}
