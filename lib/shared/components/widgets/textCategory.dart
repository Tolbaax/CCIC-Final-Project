import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/shared/components/widgets/textFormFiled.dart';

class TextCategory extends StatelessWidget {
  final String title;
  final String hintText;
  final TextInputType? inputType;
  final int? maxLength;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? onTab;
  const TextCategory({
    Key? key,
    required this.title,
    required this.hintText,
    this.inputType = TextInputType.text,
    this.maxLength,
    this.controller,
    this.validator,
    this.onTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        DefaultTextFormFiled(
          controller: controller,
          hintText: hintText,
          inputType: inputType,
          onTab: onTab,
          validator: validator,
          maxLength: maxLength,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10),
        ),
      ],
    );
  }
}
