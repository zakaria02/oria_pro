import 'package:flutter/material.dart';

import 'oria_rounded_input.dart';

class OriaRoundedPassword extends StatefulWidget {
  const OriaRoundedPassword({
    super.key,
    this.onTextChanged,
  });

  final Function(String)? onTextChanged;

  @override
  State<StatefulWidget> createState() {
    return _OriaRoundedPasswordState();
  }
}

class _OriaRoundedPasswordState extends State<OriaRoundedPassword> {
  bool _isPassword = true;
  @override
  Widget build(BuildContext context) {
    return OriaRoundedInput(
      hintText: "Password",
      isPassowrd: _isPassword,
      passwordVisibility: () => setState(() {
        _isPassword = !_isPassword;
      }),
      onTextChange: widget.onTextChanged,
    );
  }
}
