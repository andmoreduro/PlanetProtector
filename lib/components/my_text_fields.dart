import 'package:flutter/material.dart';

class _TextField extends StatelessWidget {
  final InputDecoration inputDecoration;
  final int? maxLines;
  final bool obscureText;
  final ScrollController? scrollController;
  final TextEditingController textEditingController;
  final TextInputType textInputType;

  const _TextField({
    super.key,
    required this.inputDecoration,
    this.maxLines = 1,
    this.obscureText = false,
    this.scrollController,
    required this.textEditingController,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: inputDecoration,
      keyboardType: textInputType,
      maxLines: maxLines,
      obscureText: obscureText,
      scrollController: scrollController,
    );
  }
}

class RegularTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;

  const RegularTextField({
    super.key,
    this.hintText = '',
    this.obscureText = false,
    required this.textEditingController,
    this.textInputType = TextInputType.text,
  });
  
  @override
  Widget build(BuildContext context) {
    return _TextField(
      inputDecoration: InputDecoration(
        hintText: hintText,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      obscureText: obscureText,
      textEditingController: textEditingController,
      textInputType: textInputType,
    );
  }
}

class MultilineTextField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final bool obscureText;
  final TextEditingController textEditingController;
  final TextInputType textInputType;

  const MultilineTextField({
    super.key,
    this.hintText = '',
    this.maxLines = 2,
    this.obscureText = false,
    required this.textEditingController,
    this.textInputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return _TextField(
      inputDecoration: InputDecoration(
        hintText: hintText,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      maxLines: maxLines < 1 ? 1 : maxLines,
      obscureText: obscureText,
      textEditingController: textEditingController,
      textInputType: textInputType,
    );
  }
}
