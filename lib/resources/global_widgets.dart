import 'package:flutter/material.dart';

class GlobalWidgets {
  static Widget customButton({
    void Function()? onPressed,
    Color? color,
    required Widget childWidget,
  }) {
    return TextButton(
      style: TextButton.styleFrom(backgroundColor: color),
      onPressed: onPressed,
      child: childWidget,
    );
  }

  static Widget customTextFormField({
    String? hintText,
    Color? hintTextColor,
    bool? obsecureText,
    void Function()? onPressedSuffixIcon,
    void Function(String)? onChanged,
    Widget? suffixIconData,
    Widget? prefixIconData,
    Color? iconColor,
    double? contentPaddingValue,
    bool? readOnlyValue,
  }) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        readOnly: readOnlyValue ?? false,
        //onEditingComplete: () => print(textController?.text),
        obscureText: obsecureText ?? false,
        //controller: textController,
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        // validator: (value) => validation!(value),
        onChanged: onChanged,
        cursorColor: Colors.grey,
        style: const TextStyle(color: Colors.white),
        // keyboardType: keyboardType,
        //inputFormatters: inputFormatters,
        decoration: InputDecoration(
          contentPadding: contentPaddingValue != null
              ? EdgeInsets.all(contentPaddingValue)
              : const EdgeInsets.only(left: 20),
          prefixIcon: prefixIconData,
          suffixIcon: suffixIconData != null
              ? IconButton(
                  onPressed: onPressedSuffixIcon,
                  icon: suffixIconData,
                )
              : null,
          fillColor: Colors.transparent,
          filled: true,
          //focusColor: Colors.grey,
          hintText: hintText,
          hintStyle:
              TextStyle(color: hintTextColor ?? Colors.white, fontSize: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
        ),
      ),
    );
  }
}
