import 'package:asbeza/asbeza.dart';

class MainBackground extends StatelessWidget {
  const MainBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width, // Set container width
      height: MediaQuery.of(context).size.height, // Set container height
      child: Image.asset(
        'assets/images/background.png',
        fit: BoxFit.fill,
        width: MediaQuery.of(context).size.width, // Set container width
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}
