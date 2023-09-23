import 'package:asbeza/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:asbeza/features/authentication/presentation/screens/login_page..dart';
import 'package:asbeza/features/authentication/presentation/screens/login_sign_up_toggler.dart';
import 'package:asbeza/features/authentication/presentation/screens/signup_page.dart';
import 'package:asbeza/features/home/presentation/screens/home_page.dart';
import 'package:asbeza/features/onboarding_screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<LoginBloc, LoginState>(
        builder: ((context, state) {
      if (state is LoginWithGoogleSuccess || state is LoginSuccess) {
        return const HomePage();
      } else {
        return const LoginSignUPToggler();
      }
    })
        // StreamBuilder<User?>(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot) {
        //     print("we are in the auth page now ===================");
        //     if (snapshot.hasData) {
        //       print("The snapshot has found some data ================");
        //       print(snapshot.connectionState);
        //       return const HomePage();
        //     } else if (snapshot.hasError) {
        //       print("The snapshot has error =============");
        //       return const Text("Please try again");
        //     } else {
        //       print("The snapshot has not found some data =============");
        //       return const LoginSignUPToggler();
        //     }
        //   },
        // ),
        ));
  }
}
