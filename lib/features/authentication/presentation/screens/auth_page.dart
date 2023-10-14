import 'package:asbeza/asbeza.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LoginBloc, LoginState>(
        builder: ((context, state) {
          if (state is LoginWithGoogleSuccess || state is LoginSuccess) {
            return const HomePage();
          } else {
            return const LoginSignUPToggler();
          }
        }),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
