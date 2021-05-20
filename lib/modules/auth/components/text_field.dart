import 'package:flutter/material.dart';

class WhiteTextField extends StatefulWidget {
  final String title;
  final Icon icon;
  final TextEditingController myController;
  final Function(String) onChanged;
  final String Function(String) onValidate;
  final bool obscureText;
  final bool autoValidate;
  WhiteTextField({
    @required this.title,
    this.icon,
    this.myController,
    this.onChanged,
    this.onValidate,
    this.obscureText = false,
    this.autoValidate = false,
  });
  @override
  _WhiteTextFieldState createState() => _WhiteTextFieldState();
}

class _WhiteTextFieldState extends State<WhiteTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.myController,
        onChanged: widget.onChanged,
        autovalidate: widget.autoValidate,
        validator: widget.onValidate,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
          ),
          filled: true,
          prefixIcon: widget.icon,
          hintText: widget.title,
        ));
  }
}
