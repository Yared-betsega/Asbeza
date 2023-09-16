import 'package:flutter/material.dart';

import '../constants/colors.dart';

InputDecoration textInputDecoration() {
  return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      fillColor: Colors.grey[200],
      filled: true);
}
