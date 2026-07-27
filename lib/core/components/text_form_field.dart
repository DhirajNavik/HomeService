import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../extensions/context_extension.dart';
import '../utils/app_palettes.dart';
import '../utils/dimens.dart';
import '../utils/sizedBox.dart';

class CommonTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final bool? showCursor;

  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;

  final int? maxLines;
  final int? maxLength;
  final bool isPassword;
  final bool? isRequired;
  final bool enabled;
  final String? Function(String?)? validator;
  final FocusNode? focus;
  final FocusNode? nextFocus;
  final Widget? prefixIcon;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final Function()? onTap;
  final String? labelText;
  final String? hintText;
  final Color? cursorColor;
  final bool? alignLabel;
  final EdgeInsetsGeometry? contentPadding;
  final String? initialValue;
  final List<TextInputFormatter>? inputFormatters;
  final String? name;
  final Widget? suffixIcon;
  const CommonTextFormField({
    super.key,
    this.onTap,
    this.controller,
    this.textStyle,
    this.showCursor = true,
    this.maxLength,
    this.labelText,
    this.hintText,
    this.cursorColor = AppPalettes.blackColor,
    this.maxLines = 1,
    this.prefixIcon,
    this.alignLabel = false,
    this.keyboardType = TextInputType.emailAddress,
    this.isPassword = false,
    this.focus,
    this.enabled = true,
    this.nextFocus,
    this.onChanged,
    this.validator,
    this.initialValue,
    this.isRequired,
    this.name,
    this.contentPadding,
    this.inputFormatters,
    this.suffixIcon,
    this.hintStyle,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name != null) ...[
          FittedBox(
            child: Text(
              "$name ${isRequired == true ? '*' : ''}",
              style: labelStyle ?? context.textTheme.titleSmall,
            ),
          ),
          SizeBox.sizeHX2,
        ],
        TextFormField(
          key: ValueKey(name),
          initialValue: initialValue,
          onChanged: onChanged,
          keyboardType: keyboardType,
          obscureText: isPassword,
          maxLines: maxLines,
          maxLength: maxLength,
          validator: validator,
          inputFormatters: inputFormatters,
          showCursor: showCursor,
          cursorColor: cursorColor,
          cursorErrorColor: cursorColor,
          cursorHeight: Dimens.allPaddingX5,
          onTap: onTap,
          style: textStyle ?? context.textTheme.bodyLarge,
          controller: controller,
          onFieldSubmitted: (submitValue) {
            FocusScope.of(context).requestFocus(nextFocus);
          },
          enabled: enabled,
          focusNode: focus,
          decoration: InputDecoration(
            contentPadding: contentPadding,
            hintText: hintText,
            hintStyle:
                hintStyle ??
                context.textTheme.bodyMedium?.copyWith(
                  color: AppPalettes.textSecondary,
                ),
            alignLabelWithHint: alignLabel,
            counterText: "",
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}