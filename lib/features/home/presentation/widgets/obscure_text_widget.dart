import 'package:asbeza/asbeza.dart';

class ObscureTextWidget extends StatelessWidget {
  final String text;
  final bool isObscure;
  final bool isTotalBalance;

  const ObscureTextWidget(
      {super.key,
      required this.text,
      required this.isObscure,
      required this.isTotalBalance});

  @override
  Widget build(BuildContext context) {
    return Text(
      isObscure ? "*" * text.length : text,
      style: TextStyle(
        color: Colors.white,
        fontSize: isTotalBalance ? 21.sp : 18.5.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
