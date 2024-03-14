import 'package:flutter/material.dart';

class STextField extends StatelessWidget {
  const STextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.obsureText = false,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final Icon? prefixIcon;
  final bool obsureText;
  final IconButton? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: TextFormField(
        controller: controller,
        obscureText: obsureText,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
