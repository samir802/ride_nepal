import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/custom_text_style.dart';
import '../../utils/image_path.dart';
import '../../utils/validator.dart';

class CustomPasswordField extends StatelessWidget {
  final String hint;
  final FocusNode? focusNode;
  final bool eye;
  final VoidCallback onEyeClick;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Function(String)? onSubmitted;
  final String? labelText;

  const CustomPasswordField({
    Key? key,
    required this.hint,
    required this.eye,
    required this.onEyeClick,
    required this.controller,
    required this.textInputAction,
    this.validator,
    this.onSubmitted,
    this.focusNode,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: onSubmitted,
      controller: controller,
      validator: validator ?? Validators.checkPasswordField,
      obscureText: eye,
      maxLines: 1,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        label: labelText != null
            ? Text(
                labelText ?? "",
                style: CustomTextStyles.f16W400(
                  color: AppColors.primaryColor,
                ),
              )
            : null,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.borderColor),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.errorColor),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.secondaryColor),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: AppColors.errorColor),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        prefixIcon: const Icon(
          Icons.key,
          color: Colors.black,
        ),
        suffixIcon: IconButton(
          onPressed: onEyeClick,
          icon: (eye)
              ? SvgPicture.asset(
                  ImagePath.eye,
                  height: 13,
                  colorFilter: ColorFilter.mode(
                      AppColors.textColor.withOpacity(0.5), BlendMode.srcIn),
                  fit: BoxFit.scaleDown,
                )
              : SvgPicture.asset(
                  ImagePath.eyeOff,
                  height: 19,
                  colorFilter: const ColorFilter.mode(
                      AppColors.textColor, BlendMode.srcIn),
                  fit: BoxFit.scaleDown,
                ),
        ),
        errorStyle: const TextStyle(fontSize: 12),
        hintText: hint,
        hintStyle: CustomTextStyles.f16W400(color: AppColors.shimmerBase),
      ),
      style: CustomTextStyles.f16W400(),
    );
  }
}
