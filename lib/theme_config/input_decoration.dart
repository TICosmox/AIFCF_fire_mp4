import 'package:flutter/material.dart';

class InputDecorations{

  static InputDecoration authLoginDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 25),
      labelText: labelText,
      hintText: hintText,
      prefixIcon: prefixIcon != null
        ? Icon(prefixIcon)
        :null,
      hintStyle: const TextStyle( color: Color(0xffA6B0BD),
      ),
      fillColor: Colors.white,
      filled: true,
      
      prefixIconConstraints: const BoxConstraints(minWidth: 75),
    );
  }

  static BoxDecoration boxDecoration(){
    return const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [BoxShadow(
        color: Colors.green,
        blurRadius: 25,
        offset: Offset(0, 5),
        spreadRadius: -25
        )
      ]
    );
  }

}
