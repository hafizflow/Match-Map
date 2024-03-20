import 'package:flutter/material.dart';

// custom text field
class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final ValueChanged<String>? onChanged;
  const CustomTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 17),
        hintStyle: const TextStyle(color: Colors.black38),
        prefix: const Padding(padding: EdgeInsets.only(left: 16)),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black26,
            width: 2,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 2,
          ),
        ),
        suffixIcon: Icon(suffixIcon),
      ),
    );
  }
}
