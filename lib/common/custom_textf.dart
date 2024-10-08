// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextf extends StatelessWidget {
  const CustomTextf({
    Key? key,
    required this.controller,
    required this.hintText,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
  }) : super(key: key);
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.all(16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        hintText: hintText,
      ),
    );
  }
}
