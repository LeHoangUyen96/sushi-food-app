import 'package:flutter/material.dart';

class InforOrder extends StatefulWidget {
  final text;
  final title;
  InforOrder({
    this.text,
    this.title,
  });
  @override
  _InforOrderState createState() => _InforOrderState();
}

class _InforOrderState extends State<InforOrder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            widget.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Text(
            widget.text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
