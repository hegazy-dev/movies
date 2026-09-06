import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:movies/core/theme/app_text_styles.dart';

class DefaultTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final String? prefixIconImageName;
  final String? suffixIconImageName;
  final Size prefixIconSize;
  final void Function(String)? onChange;
  final bool isPassword;
  final String? Function(String?)? validator;

  const DefaultTextFormField({
    super.key,
    required this.hintText,
    this.controller,
    this.prefixIconImageName,
    this.suffixIconImageName,
    this.prefixIconSize = const Size(24, 24),
    this.onChange,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool isObscure = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyles.textTheme.titleLarge,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: AppTextStyles.textTheme.titleLarge,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        prefixIcon: widget.prefixIconImageName == null
            ? null
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SvgPicture.asset(
                  'assets/icons/${widget.prefixIconImageName}.svg',
                  width: widget.prefixIconSize.width,
                  height: widget.prefixIconSize.height,
                  fit: BoxFit.contain,
                ),
              ),
        prefixIconConstraints: BoxConstraints(
          minWidth: widget.prefixIconSize.width + 24,
          maxWidth: widget.prefixIconSize.width + 24,
          minHeight: widget.prefixIconSize.height,
          maxHeight: 56,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                icon: Icon(
                  isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.white,
                ),
              )
            : widget.suffixIconImageName == null
            ? null
            : SvgPicture.asset(
                'assets/icons/${widget.suffixIconImageName}.svg',
                height: 24,
                width: 24,
                fit: .scaleDown,
              ),
      ),
      controller: widget.controller,
      onChanged: widget.onChange,
      obscureText: isObscure,
      validator: widget.validator,
      autovalidateMode: .onUserInteraction,
      onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
    );
  }
}
