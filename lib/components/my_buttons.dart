import 'package:flutter/material.dart';

class _Button extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  const _Button({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text( text),
    );
  }
}

class RegularButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;

  const RegularButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return _Button(
      onPressed: onPressed,
      text: text,
    );
  }
}