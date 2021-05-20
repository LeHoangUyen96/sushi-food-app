import 'package:flutter/material.dart';

class ListProfile extends StatefulWidget {
  final String text;
  final Icon preIcon;
  final Function press;
  ListProfile({this.text, this.preIcon, this.press});
  @override
  _ListProfileState createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      widget.preIcon,
      Container(width: 10.0),
      Text(widget.text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
      Spacer(),
      IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: widget.press)
    ]);
  }
}
