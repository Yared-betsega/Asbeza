import 'package:flutter/material.dart';

class MainBackground extends StatelessWidget {
  const MainBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width, // Set container width
      height: MediaQuery.of(context).size.height, // Set container height
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.png'),
          fit: BoxFit.cover, // Ensure the image covers the container
        ),
      ),
    );
  }
}
