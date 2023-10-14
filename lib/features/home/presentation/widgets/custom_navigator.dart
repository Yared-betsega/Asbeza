import 'package:asbeza/asbeza.dart';

class CustomNavigator extends StatelessWidget {
  const CustomNavigator({
    super.key,
    required this.isStat,
    required this.text,
    required this.onPressed,
    required this.iconUrl,
    required this.color,
  });
  final bool isStat;
  final Color color;
  final String text;
  final VoidCallback onPressed;
  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: color,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              fontFamily: 'Inter',
            ),
          ),
          IconButton(
            icon: SvgPicture.asset(
              iconUrl,
            ),
            onPressed: () {
              // Add your menu button logic here
            },
          ),
        ],
      ),
    );
  }
}
