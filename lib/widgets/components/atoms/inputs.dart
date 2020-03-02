import 'package:flutter/material.dart';

class AtmTextField extends StatelessWidget {
  final IconData _icon;
  final String _hintText;
  final String _errorText;
  final bool validate;
  final bool obscureText;
  final int _maxLines;
  final TextEditingController _controller;

  AtmTextField(
    this._icon,
    this._hintText,
    this._errorText,
    this._maxLines,
    this._controller,
    {
      @required this.obscureText,
      @required this.validate,
    }
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: _maxLines,
      autocorrect: false,
      obscureText: obscureText,
      style: TextStyle(
          fontFamily: 'roboto', fontSize: 20.0, color: Colors.black87),
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(_icon),
        hintText: _hintText,
        errorText: validate ? _errorText : null
      ),
    );
  }
}