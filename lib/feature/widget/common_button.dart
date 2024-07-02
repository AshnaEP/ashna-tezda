import 'package:flutter/material.dart';

import '../../styles/colors.dart';
import '../../styles/text_styles.dart';

Widget commonButton(BuildContext context, String btnText,Function callbackAction) {
  return Container(
    width: double.infinity,
    height: 50,
    child: TextButton(
      onPressed: ()  => callbackAction(),
      child: Padding(
        padding: const EdgeInsets.all(2),
        child:Text(
            btnText,style: buttonTextStyle),
      ),
      style: TextButton.styleFrom(
        foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        backgroundColor: greenButtonColor,
      ),
    ),
  );
}