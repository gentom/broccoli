import 'package:flutter/material.dart';

typedef OnPressedMethod = void Function(BuildContext context);

class AtmFlatButton extends StatelessWidget {
  final String _buttonText;
  final OnPressedMethod _onPressedMethod;
  AtmFlatButton(this._buttonText, this._onPressedMethod);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => _onPressedMethod(context),
      color: Colors.blue,
      textColor: Colors.white,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.black,
      padding: EdgeInsets.all(8.0),
      splashColor: Colors.blueAccent,
      child: Text(
        _buttonText,
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}