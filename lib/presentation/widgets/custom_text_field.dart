import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onehaven_flutter_challenge/utils/color_const.dart';
import 'package:onehaven_flutter_challenge/utils/theme.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.controller,
    this.obscureText,
    this.textInputType,
    this.onEditingComplete,
    this.onFocusChange,
    this.onChanged,
    this.maxLines,
    this.prefixIcon,
    this.maxLength,
    this.suffixIcon,
    this.inputFormatters,
    this.readOnly,
    this.filled,
    this.filledColor,
    required this.label,
    this.focusNode,
    this.borderColor,
    this.onTap,
    this.validator,
    this.textCapitalization = TextCapitalization.none,
  });
  final String? hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? textInputType;
  final void Function()? onEditingComplete;
  final void Function(bool)? onFocusChange;
  final void Function(String)? onChanged;
  final int? maxLines;
  final String? prefixIcon;
  final int? maxLength;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final bool? filled;
  final Color? filledColor;
  final String label;
  final FocusNode? focusNode;
  final Color? borderColor;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: lightBorderColor),
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      child: TextFormField(
        readOnly: readOnly ?? false,
        onTap: onTap,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        keyboardType: textInputType ?? TextInputType.name,
        obscureText: obscureText ?? false,
        obscuringCharacter: "•",
        controller: controller,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        style: mediumTextRubik().copyWith(color: lightTextColor),
        textCapitalization: textCapitalization,
        validator: validator,
        decoration: InputDecoration(
          filled: filled,
          fillColor: filledColor,
          counter: const Offstage(),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon != null
              ? SvgPicture.asset(
                  prefixIcon!,
                  fit: BoxFit.scaleDown,
                )
              : null,
          label: Text(
            label,
            style: normalTextRubik().copyWith(color: lightTextColor),
          ),
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 14.0.w),
          hintText: hintText,
          hintStyle: mediumTextRubik().copyWith(color: lightTextColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class BorderlessCustomTextField extends StatelessWidget {
  const BorderlessCustomTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.obscureText,
      this.textInputType,
      this.onEditingComplete,
      this.onFocusChange,
      this.onChanged,
      this.maxLines,
      this.prefixIcon,
      this.maxLength,
      this.suffixIcon,
      this.inputFormatters,
      this.readOnly,
      this.filled,
      this.filledColor,
      required this.label});
  final String? hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? textInputType;
  final void Function()? onEditingComplete;
  final void Function(bool)? onFocusChange;
  final void Function(String)? onChanged;
  final int? maxLines;
  final String? prefixIcon;
  final int? maxLength;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final bool? filled;
  final Color? filledColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: onFocusChange,
      child: TextFormField(
        readOnly: readOnly ?? false,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        keyboardType: textInputType ?? TextInputType.name,
        obscureText: obscureText ?? false,
        obscuringCharacter: "•",
        controller: controller,
        onEditingComplete: onEditingComplete,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
        style: mediumTextRubik().copyWith(color: lightTextColor),
        decoration: InputDecoration(
          filled: filled,
          fillColor: filledColor,
          counter: const Offstage(),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon != null
              ? SvgPicture.asset(
                  prefixIcon!,
                  fit: BoxFit.scaleDown,
                )
              : null,
          label: Text(
            label,
            style: normalTextRubik().copyWith(color: lightTextColor),
          ),
          hintText: hintText,
          hintStyle: mediumTextRubik().copyWith(color: lightTextColor),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

 

class CustomDropdownWidget<T> extends StatelessWidget {
  const CustomDropdownWidget(
      {super.key,
      this.width,
      required this.list,
      required this.selectedValue,
      required this.onChanged,
      this.child,
      this.hintText});

  final double? width;
  final List<T> list;
  final T? selectedValue;
  final void Function(T?) onChanged;
  final Widget? child;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: lightBorderColor, width: 1.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: DropdownButtonHideUnderline(
          child: DropdownButtonFormField<T>(
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            isExpanded: true,
            hint: Text(
              hintText ?? "Please Select",
              style: mediumTextRubik().copyWith(color: lightTextColor),
            ),
            icon: Icon(
              Icons.arrow_drop_down_circle,
              color: lightBorderColor,
            ),
            items: list
                .map(
                  (T value) => DropdownMenuItem(
                    value: value,
                    child: child ??
                        Text(
                          value.toString(),
                          style: normalTextRubik(),
                        ),
                  ),
                )
                .toList(),
            value: selectedValue,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
