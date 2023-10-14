import 'package:asbeza/asbeza.dart';

class CustomRectangularCard extends StatelessWidget {
  const CustomRectangularCard({
    super.key,
    required this.isObscure,
    required this.name,
    required this.amount,
    required this.icon,
  });

  final bool isObscure;
  final String name;
  final String amount;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.w300,
                fontFamily: "Inter",
              ),
            ),
            Icon(
              icon,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        ObscureTextWidget(
          text: amount,
          isObscure: isObscure,
          isTotalBalance: false,
        )
      ],
    );
  }
}
