import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Future _timer;
  @override
  void initState() {
    super.initState();
    // Add a delay before navigating to the main content
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go("/auth");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width, // Set container width
        height: MediaQuery.of(context).size.height, // Set container height
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/asbeza_logo.png'),
            fit: BoxFit.cover, // Ensure the image covers the container
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    //     overlays: SystemUiOverlay.values);
  }
}
