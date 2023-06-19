// ignore_for_file: file_names
import 'package:flutter/material.dart';

class SidebarItem extends StatefulWidget {
  final Icon icon;
  final String itemName;
  final Widget route;

  const SidebarItem(
      {Key? key,
      required this.icon,
      required this.itemName,
      required this.route})
      : super(key: key);

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.icon,
      title: Text(
        widget.itemName,
        style:
            const TextStyle(fontFamily: 'Futura', fontWeight: FontWeight.bold),
      ),
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (context) {
        return widget.route;
      })),
    );
  }
}
