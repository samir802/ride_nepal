import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/custom_text_style.dart';

class CustomTextField extends StatelessWidget {
  final Function(String)? onValueChange;
  final FocusNode? focusNode;
  final String hint;
  final IconData? preIconPath;
  final String? suffixIconPath;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final Color? border;
  final Color? fillColor;
  final bool? readOnly;
  final bool? showError;
  final bool? autofocus;
  final String? labelText;
  final Function()? onTap;
  final Function(String)? onSubmitted;
  final int? maxCharacters;
  final TextCapitalization textCapitalization;

  const CustomTextField({
    super.key,
    this.fillColor,
    required this.hint,
    this.preIconPath,
    this.suffixIconPath,
    this.onValueChange,
    this.controller,
    this.validator,
    required this.textInputAction,
    required this.textInputType,
    this.border,
    this.readOnly = false,
    this.showError = true,
    this.textCapitalization = TextCapitalization.sentences,
    this.onTap,
    this.onSubmitted,
    this.autofocus = false,
    this.maxCharacters,
    this.focusNode,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      maxLength: maxCharacters,
      autofocus: autofocus!,
      textCapitalization: textCapitalization,
      onFieldSubmitted: onSubmitted,
      onTap: (onTap != null) ? onTap! : null,
      readOnly: (readOnly == null) ? false : readOnly!,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      maxLines: 1,
      validator: (validator != null) ? validator : null,
      controller: (controller != null) ? controller : null,
      onChanged: (text) {
        if (onValueChange != null) {
          onValueChange!(text);
        }
      },
      decoration: InputDecoration(
        label: labelText != null
            ? Text(
                labelText ?? "",
                style: CustomTextStyles.f16W400(
                  color: Colors.grey,
                ),
              )
            : null,
        fillColor: fillColor ?? Colors.transparent,
        filled: fillColor != null,
        prefixIcon: (preIconPath != null) ? Icon(preIconPath) : null,
        suffixIcon: (suffixIconPath != null)
            ? SvgPicture.asset(suffixIconPath!, fit: BoxFit.scaleDown)
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: border ?? Colors.grey),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: border ?? Colors.red),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: border ?? Colors.black),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: border ?? Colors.red),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorStyle: (showError!)
            ? const TextStyle(fontSize: 12)
            : const TextStyle(fontSize: 0),
        hintText: hint,
        hintStyle: CustomTextStyles.f16W400(color: Colors.grey),
      ),
      style: CustomTextStyles.f16W400(
          color: (readOnly ?? false) ? Colors.grey : null),
    );
  }
}
