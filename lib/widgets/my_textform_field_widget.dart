
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String hintText;
  final double? radius;
  final  bool? obscureText;
  const MyTextFormField({Key? key, required this.controller, required this.validator,
    required this.hintText,  this.radius, this.obscureText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      obscureText: obscureText ?? false,
      controller: controller,
      validator:validator,
      decoration: InputDecoration(

        border: OutlineInputBorder(borderRadius: BorderRadius.circular(radius ?? 0)),

        hintText: hintText,

      ),
    );
  }
}

