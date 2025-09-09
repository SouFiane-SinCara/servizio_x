import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:servizio_x/core/helpers/app_extensions.dart';
import 'package:servizio_x/core/helpers/size_boxes.dart';
import '../theme/app_color.dart';
import '../theme/text_styles.dart';

class PrimaryTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String hintText;
  final Widget suffixIcon;
  final bool? obscureText;
  final String? title;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final bool? enabled;

  const PrimaryTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.suffixIcon,
    this.enabled,
    this.title,
    this.textInputAction,
    this.validator,
    this.obscureText,
  });

  @override
  State<PrimaryTextField> createState() => _PrimaryTextFieldState();
}

class _PrimaryTextFieldState extends State<PrimaryTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null)
            Column(
              children: [
                AutoSizeText(widget.title!, style: TextStyles.blackW500),
                heightSize(10, context),
              ],
            ),
          TextFormField(
            validator: widget.validator,
            enabled: widget.enabled,
            textInputAction: widget.textInputAction ?? TextInputAction.next,
            obscureText: widget.obscureText ?? false,
            controller: widget.controller,
            decoration: InputDecoration(
              hintText: widget.hintText,

              hintStyle: TextStyles.greyW400,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.lightGrey, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.black, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: widget.suffixIcon,
              suffixIconColor: WidgetStateColor.resolveWith((states) {
                if (states.contains(WidgetState.focused)) {
                  return AppColor.black;
                }
                return AppColor.lightGrey;
              }),
              fillColor: AppColor.lightWhite,
              filled: true,
              isDense: true,
              contentPadding: EdgeInsets.only(
                top: 15.h(context),
                bottom: 15.h(context),
                left: 30.w(context),
              ),
              border: InputBorder.none,
            ),
            style: TextStyle(height: 2.h(context), color: AppColor.black),
          ),
        ],
      ),
    );
  }
}
