import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultTextFormFiled extends StatelessWidget {
  final String? hintText;
  final bool secure;
  final TextInputType? inputType;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? label;
  final FormFieldSetter? onSaved;
  final Function()? onTab;
  final Function()? suffixTab;
  final IconData? suffix;
  final IconData? prefix;
  final TextInputAction? textInputAction;
  final EdgeInsetsGeometry? contentPadding;
  const DefaultTextFormFiled({
    Key? key,
    this.hintText,
    this.secure = false,
    this.inputType = TextInputType.text,
    this.controller,
    this.validator,
    this.label,
    this.suffix,
    this.prefix,
    this.onTab,
    this.suffixTab,
    this.onSaved,
    this.textInputAction,
    this.contentPadding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      obscureText: secure,
      controller: controller,
      onSaved: onSaved,
      onTap: onTab,
      validator: validator,
      textInputAction: textInputAction,
      style: const TextStyle(fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey.shade700),
        hintText: hintText,
        contentPadding: contentPadding,
        suffixIcon: GestureDetector(
          onTap: suffixTab,
          child: Icon(suffix),
        ),
        prefixIcon: GestureDetector(
          onTap: () {},
          child: Icon(prefix),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0.r),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }
}
