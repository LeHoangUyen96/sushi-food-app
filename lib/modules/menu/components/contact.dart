import 'package:flutter/material.dart';
import 'package:sushi_food_app/constants/main_constant.dart';

class Contact extends StatefulWidget {
  final String preText;
  final String suxText;
  final Icon icon;
  final Function open;
  Contact({
    this.preText,
    this.suxText,
    this.icon,
    this.open,
  });
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.icon,
        Container(width: 5.0),
        Text(widget.preText,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
        Container(width: 5.0),
        TextButton(
          child: Text(widget.suxText,
              style: TextStyle(fontSize: 15, color: Color(MainConstant.black))),
          onPressed: widget.open,
        ),
      ],
    );
  }
}
