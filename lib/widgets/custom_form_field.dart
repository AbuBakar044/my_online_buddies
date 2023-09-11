import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final int? maxLines;
  const CustomFormField({
    super.key,
    required this.controller,
    this.hint,
    this.validator,
    this.textInputType,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
