import 'package:flutter/material.dart';

final textInputDecoration = InputDecoration(
  fillColor: Colors.white10,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Colors.transparent)
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Colors.transparent)
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Colors.transparent)
  )
);

final myButtonStyle =  ButtonStyle(
  elevation: WidgetStateProperty.all(1),
  backgroundColor: WidgetStateProperty.all(Colors.green[700]),
  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10)
    )
  )
);
