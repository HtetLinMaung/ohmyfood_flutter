import 'package:flutter/material.dart';
import 'package:ohmyfood_flutter/constants/colors.dart';

class FilledInput extends StatelessWidget {
  final Function(String) onChanged;
  final TextEditingController controller;
  final String errorText;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;

  FilledInput({
    this.onChanged,
    this.controller,
    this.errorText,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: errorText == null ? 40 : 60,
      child: TextField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        controller: controller,
        expands: !obscureText ? true : false,
        minLines: null,
        maxLines: !obscureText ? null : 1,
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 15,
          fontFamily: 'Poppins',
        ),
        decoration: InputDecoration(
          hintText: hintText,
          errorText: errorText,
          contentPadding: EdgeInsets.all(10),
          filled: true,
          fillColor: kInputBackgroundColor,
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(6)),
          ),
        ),
      ),
    );
  }
}
