import 'package:asbeza/asbeza.dart';

InputDecoration passwordInputDecoration(
    {required bool isObscure, required VoidCallback onPressed}) {
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
    filled: true,
    suffixIcon: IconButton(
      onPressed: onPressed,
      icon: Icon(
        isObscure ? Icons.visibility : Icons.visibility_off,
        color: primaryColor,
      ),
    ),
  );
}
