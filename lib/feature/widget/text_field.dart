import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';
Widget textFiled(StateSetter setState,String hintText,TextEditingController controller,String errorText){
  return TextField(
    style: textFieldInputStyle,
    controller: controller,
    cursorColor: hintColor,
    onChanged: (_) => setState((){}),
    decoration: InputDecoration(
      contentPadding: const EdgeInsets.only(left: 15,top: 2,bottom: 2),
      fillColor: whiteColor,
      filled: true,
      hintText: hintText,
      hintStyle: hintTextStyle,
      errorText: controller.text == '' ? errorText : '',
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: whiteColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: whiteColor),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: whiteColor),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: whiteColor),
      ),
    ),
  );
}