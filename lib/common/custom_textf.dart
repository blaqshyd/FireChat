// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextf extends StatelessWidget {
  const CustomTextf({
    Key? key,
    required this.controller,
    required this.hintText,
    this.textInputAction,
    this.obscureText,
  }) : super(key: key);
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: hintText,
      ),
    );
  }
}
