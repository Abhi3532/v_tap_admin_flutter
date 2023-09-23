import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLine;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final VoidCallback? onFieldSubmitted;
  final bool obscureText;
  final TextInputAction? textInputAction;
  final bool? readOnly;
  final VoidCallback? onTap;
  const AppTextField(
      {Key? key,
        this.hintText,
        this.hintStyle,
        this.style,
        this.onChanged,
        this.contentPadding,
        this.maxLine,
        required this.controller,
        this.focusNode,
        this.suffixIcon,
        this.prefixIcon,
        this.onFieldSubmitted,
        this.obscureText = false,
        this.textInputAction,
        this.readOnly,
        this.onTap})
      : super(key: key);

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      controller: widget.controller,
      focusNode: widget.focusNode,
      textAlignVertical: TextAlignVertical.center,
      textInputAction: widget.textInputAction,
      readOnly: widget.readOnly ?? false,
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: widget.hintStyle,
          isDense: true,
          border: InputBorder.none,
          contentPadding: widget.contentPadding,
          suffixIconConstraints: const BoxConstraints(),
          suffixIcon: widget.suffixIcon,
          prefixIconConstraints: const BoxConstraints(),
          prefixIcon: widget.prefixIcon),
      maxLines: widget.maxLine,
      style: widget.style,
      onChanged: widget.onChanged,
      onFieldSubmitted: (String value) {
        widget.onFieldSubmitted!();
        setState(() {});
      },
      onTap: widget.onTap,
    );
  }
}