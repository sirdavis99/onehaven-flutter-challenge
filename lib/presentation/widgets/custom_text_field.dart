import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/theme.dart';

import '../../domain/entities/vehicle.dart';

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

class CustomGooglePlaceTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final void Function(Prediction)? itemClick;
  const CustomGooglePlaceTextField(
      {super.key,
      required this.label,
      required this.controller,
      this.itemClick});

  @override
  Widget build(BuildContext context) {
    return GooglePlaceAutoCompleteTextField(
      textEditingController: controller,
      googleAPIKey: dotenv.env['GOOGLE_API_KEY']!,
      inputDecoration: InputDecoration(
        //counter: const Offstage(),
        label: Text(
          label,
          style: normalTextRubik().copyWith(color: lightTextColor),
        ),

        enabledBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        border: InputBorder.none,
      ),
      boxDecoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: Colors.transparent,
          )),
      debounceTime: 800, // default 600 ms,

      isLatLngRequired: true, // if you required coordinates from place detail
      getPlaceDetailWithLatLng: (Prediction prediction) {
        // this method will return latlng with place detail
        debugPrint("placeDetails${prediction.lng}");
      }, // this callback is called when isLatLngRequired is true
      itemClick: itemClick,
      // if we want to make custom list item builder
      itemBuilder: (context, index, Prediction prediction) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Icon(Icons.location_on),
              7.0.horizontalSpace,
              Expanded(
                child: Text(prediction.description ?? ""),
              ),
            ],
          ),
        );
      },
      // if you want to add seperator between list items
      seperatedBuilder: const Divider(),
      // want to show close icon
      isCrossBtnShown: true,
    );
  }
}

class CustomDropdownWidget extends StatelessWidget {
  const CustomDropdownWidget(
      {super.key,
      this.width,
      required this.list,
      required this.selectedValue,
      required this.onChanged,
      this.child,
      this.hintText});

  final double? width;
  final List<VehiclesData> list;
  final VehiclesData? selectedValue;
  final void Function(VehiclesData?) onChanged;
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
          child: DropdownButtonFormField<VehiclesData>(
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
                  (VehiclesData value) => DropdownMenuItem(
                    value: value,
                    child: child ??
                        Text(
                          value.carType!,
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
