import 'package:flutter/material.dart';

class kTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  const kTextFormField(
      {Key? key,
      required this.controller,
      required this.keyboardType,
      required this.hintText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 2, color: Colors.white60),
            borderRadius: BorderRadius.circular(5)),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}
