import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.onSaved,
    required this.onChanged,
    required this.prefixIcon,
    this.isSecure = false,
    this.onTap,
    this.controller,
    this.maxLines = 1,
    this.validator,
  });
  final String hintText;
  final String? Function(String?)? validator;
  final String? Function(String?)? onSaved;
  final String? Function(String?)? onChanged;
  final IconData? prefixIcon;
  final bool isSecure;
  final void Function()? onTap;
  final TextEditingController? controller;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        hint: Text(hintText, style: TextStyle(color: Colors.grey)),
        prefixIcon: GestureDetector(onTap: onTap, child: Icon(prefixIcon)),
      ),
      obscureText: isSecure,
      validator: validator,
      onSaved: (value) => onSaved!(value),
      onChanged: (value) => onChanged!(value),
    );
  }
}
