import 'package:asbeza/asbeza.dart';

class LoginSignUPToggler extends StatefulWidget {
  const LoginSignUPToggler({super.key});

  @override
  State<LoginSignUPToggler> createState() => _LoginSignUPTogglerState();
}

class _LoginSignUPTogglerState extends State<LoginSignUPToggler> {
  bool showLoginPage = true;

  void toggleScreens() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showSignupPage: toggleScreens);
    } else {
      return SignupPage(showLoginPage: toggleScreens);
    }
  }
}
