import 'package:flutter/material.dart';
import 'package:instagram/common/constants/app_colors.dart';

class TextFormInputWidget extends StatelessWidget {
 
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefixIcon, suffixIcon;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final double? width, height;
  final bool? filled;
  final Color? fillColor;
  final FocusNode? focusNode;
  final bool? border;

  const TextFormInputWidget({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.validator,
    this.onChanged,
    this.width = 367,
    this.height = 60,
    this.suffixIcon,
    this.filled = false,
    this.fillColor, this.focusNode, this.border,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          onChanged: onChanged,
          focusNode: focusNode,
          style:  const TextStyle(color: Colors.white),
          decoration:  inputDecorationPrimary()
      ),  
    );
  }

  InputDecoration inputDecorationPrimary() => InputDecoration(
        filled: filled,
        fillColor: fillColor,
        labelText: labelText,
        hintText: hintText,
        hintStyle:  TextStyle(fontSize : 14, color: Colors.grey.shade600),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        border: border != null ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.0),
        ): null,
         focusedBorder: border != null ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(9.0),
          borderSide: const BorderSide(
            color: AppColors.lightBorder,
          ),
        ) : null,
      );
}
