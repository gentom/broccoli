import 'package:flutter/material.dart';
import 'package:broccoli/widgets/components/atoms/inputs.dart';

class MolOneLineTextField extends StatelessWidget {
  final IconData _icon;
  final String _hintText;
  final String _errorText;
  final bool validate;
  final TextEditingController _controller;

  MolOneLineTextField(
    this._icon,
    this._hintText,
    this._errorText,
    this._controller,
    {
      this.validate
    }
  );

  @override
  Widget build(BuildContext context) {
    return AtmTextField(
      _icon,
      _hintText,
      _errorText,
      1,
      _controller,
      obscureText: false,
      validate: validate,
    );
  }
}