import 'package:asbeza/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:asbeza/features/authentication/presentation/screens/login_sign_up_toggler.dart';
import 'package:asbeza/features/home/presentation/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
