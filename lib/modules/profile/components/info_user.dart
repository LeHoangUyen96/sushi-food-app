import 'package:flutter/material.dart';

class InfoUser extends StatefulWidget {
  final String text;
  final Icon icon;
  InfoUser({
    this.text,
    this.icon,
  });
  @override
  _InfoUserState createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      widget.icon,
      Container(width: 10.0),
      Text(widget.text, style: TextStyle(fontSize: 18)),
    ]);
  }
}
