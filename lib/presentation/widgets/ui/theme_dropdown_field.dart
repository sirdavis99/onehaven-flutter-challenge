import 'package:ride_hailing/gen/fonts.gen.dart';
import 'package:ride_hailing/presentation/widgets/ui/y_margin.dart';
import 'package:ride_hailing/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ThemeDropdownField extends StatefulWidget {
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isRequired;
  final String? formControlName;
  final String? hintText;
  final String? labelText;
  final int? maxLines;
  final bool readOnly;
  final List<DropdownMenuItem<dynamic>>? items;

  const ThemeDropdownField({
    super.key,
    this.suffixIcon,
    this.prefixIcon,
    this.isRequired = false,
    this.formControlName,
    this.hintText,
    this.labelText,
    this.maxLines = 1,
    this.readOnly = false,
    this.items = const [],
  });

  @override
  State<ThemeDropdownField> createState() => _ThemeDropdownFieldState();
}

class _ThemeDropdownFieldState extends State<ThemeDropdownField> {
  @override
  void initState() {
    super.initState();
  }

  getBorder(Color? inputBorder) {
    if (widget.readOnly) return ThemeColors.settingsItemBorder;
    return inputBorder ?? ThemeColors.inputBorder;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          SizedBox(
            child: Row(
              children: [
                Text(
                  widget.labelText ?? '',
                  style: const TextStyle(
                    color: ThemeColors.label,
                    fontFamily: FontFamily.satoshi,
                    fontWeight: FontWeight.w500,
                    fontSize: FontSize.md,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  width: 2,
                ),
                if (widget.isRequired)
                  Text(
                    '*',
                    style: TextStyle(
                      color: Colors.red.shade400,
                      fontFamily: FontFamily.satoshi,
                      fontWeight: FontWeight.w500,
                      fontSize: FontSize.md,
                    ),
                    textAlign: TextAlign.left,
                  ),
              ],
            ),
          ),
        if (widget.labelText != null) const YMargin(8),
        ReactiveDropdownField(
          formControlName: widget.formControlName,
          readOnly: widget.readOnly,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            enabled: !widget.readOnly,
            hintText: widget.hintText!,
            hintStyle: const TextStyle(
              fontFamily: FontFamily.satoshi,
              fontWeight: FontWeight.w400,
              fontSize: FontSize.base,
              color: ThemeColors.hintText,
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: getBorder(ThemeColors.inputBorder),
                width: 1.5,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: getBorder(ThemeColors.inputBorder),
                width: 1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: getBorder(ThemeColors.inputBorder),
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.red.shade400,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.red.shade400,
                width: 1,
              ),
            ),
            // bo
          ),
          items: [],
          // onSubmitted: widget.onSubmitted,
        ),
      ],
    );
  }
}
