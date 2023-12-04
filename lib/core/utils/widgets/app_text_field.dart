import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:technaureus/core/utils/app_colors.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.validator,
      this.inputFormat,
      this.suffixIcon,
      this.prefixIcon,
      this.keyType = TextInputType.emailAddress,
      this.errorTextColor = AppColors.red,
      this.fillColor = AppColors.white,
      this.isBordered = true,
      this.isObscured = false,
      this.borderRadius,
      this.onChanged});
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormat;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType keyType;
  final Color errorTextColor;
  final Color fillColor;
  final bool isBordered;
  final bool isObscured;
  final double? borderRadius;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        validator: validator,
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.all(Radius.circular(borderRadius ?? 30.0))),
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? 30.0)),
            borderSide: BorderSide(
              color: isBordered ? AppColors.grey : Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(borderRadius ?? 30.0)),
            borderSide: BorderSide(color: AppColors.grey),
          ),
          fillColor: fillColor,
          filled: true,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xB2B9B9B9),
            fontWeight: FontWeight.w800,
            fontSize: 14.0,
          ),
          errorStyle: TextStyle(
            color: errorTextColor,
            fontSize: 13.0,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        style: const TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
        ),
        obscureText: isObscured,
        keyboardType: keyType,
        inputFormatters: inputFormat,
        onTap: () {
          FocusNode().requestFocus(FocusNode(canRequestFocus: true));
        });
  }
}
