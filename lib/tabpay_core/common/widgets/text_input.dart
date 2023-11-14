import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputNormal extends StatelessWidget {
  const InputNormal({
    Key? key,
    this.maxLength,
    this.hintText,
    this.label,
    this.enabled = true,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.style,
    this.inputFormatters,
    this.textInputAction = TextInputAction.done,
  }) : super(key: key);

  final int? maxLength;
  final String? hintText;
  final bool enabled;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final Container? label;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setStates) => Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            enabled: enabled,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            controller: controller,
            onChanged: onChanged,
            style: style ??
                const TextStyle(
                  // fontFamily: FontFamily.codeNextSemiBold,
                  color: Colors.black,
                  fontSize: 13,
                ),
            decoration: InputDecoration(
              label: label,
              labelText: hintText,
              filled: true,
              fillColor: enabled ? Colors.white : Colors.grey,
              labelStyle: const TextStyle(
                  // fontFamily: FontFamily.codeNextSemiBold,
                  fontSize: 13,
                  color: Colors.grey),
              contentPadding: const EdgeInsets.only(
                left: 24,
                top: 16,
                bottom: 16,
              ),
              counterText: '',
              prefixIconColor: Colors.black,
              suffixIconColor: Colors.black,
              focusedErrorBorder: InputBorder.none,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              floatingLabelStyle: const TextStyle(
                decoration: TextDecoration.none,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              errorBorder: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
              alignLabelWithHint: true,
              focusColor: Colors.transparent,
            )),
      ),
    );
  }
}

class InputMultiIcon extends StatelessWidget {
  const InputMultiIcon(
      {Key? key,
      this.hintText,
      this.enabled = true,
      this.controller,
      this.onChanged,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.obscureText = false,
      this.onFieldSubmitted})
      : super(key: key);

  final String? hintText;
  final bool enabled;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Function()? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setStates) => Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
            obscureText: obscureText,
            enabled: enabled,
            keyboardType: keyboardType,
            controller: controller,
            style: const TextStyle(
                // fontFamily: FontFamily.codeNextSemiBold,
                color: Colors.black),
            decoration: InputDecoration(
              fillColor: enabled ? Colors.white : Colors.grey,
              filled: true,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              prefixIconColor: Colors.black,
              suffixIconColor: Colors.black,
              labelText: hintText,
              labelStyle: const TextStyle(
                  // fontFamily: FontFamily.codeNextSemiBold,
                  fontSize: 13,
                  color: Colors.grey),
              contentPadding: const EdgeInsets.only(
                left: 24,
                top: 16,
                bottom: 16,
              ),
              focusedErrorBorder: InputBorder.none,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              floatingLabelStyle: const TextStyle(
                decoration: TextDecoration.none,
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              errorBorder: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(width: 1, color: Colors.grey),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  width: 1,
                  color: Colors.blueGrey,
                ),
              ),
              alignLabelWithHint: true,
              focusColor: Colors.transparent,
            ),
            onFieldSubmitted: (value) {
              if (onFieldSubmitted != null) {
                onFieldSubmitted!();
              }
            },
            onChanged: onChanged),
      ),
    );
  }
}
