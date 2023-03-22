// ignore_for_file: file_names
import 'package:scouting_platform/ui/style/style.dart';
import 'package:flutter/material.dart';

class ScoutingDropdownMenu extends StatefulWidget {
  /// Options for dropdown builder

  // Margin from sides/top/bottom
  final EdgeInsetsGeometry margin;
  // Width of dropdown container
  final double width;
  // Color of container that holds dropdown
  final Color dropdownButtonColor;
  // Dropdown menu color (option selection)
  final Color dropdownMenuColor;
  // Item that is currently selected from the menu.
  // Has to be from the array which holds items.
  final String dropdownMenuSelectedItem;
  // What to do when it is changed (change variable to selected)
  final Function onChanged;
  // Array of possible items that can be picked from dropdown
  final List<String> dropdownItems;
  // Color for the selected item name
  final Color selectedItemTextColor;
  // Padding for text displayed in the dropdown
  final EdgeInsetsGeometry selectedItemTextPadding;
  // Alignment for selected item in dropdown
  final AlignmentGeometry selectedItemAlignment;
  // Font size for selected item
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
  _DropdownMenuState createState() => _DropdownMenuState();
}

class _DropdownMenuState extends State<ScoutingDropdownMenu> {
  @override
  void initState() {
    super.initState();
  }

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
