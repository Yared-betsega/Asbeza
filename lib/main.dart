import 'package:asbeza/core/routes/app_routes.dart';
import 'package:asbeza/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:asbeza/features/authentication/presentation/bloc/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import './core/injection/injection_container.dart' as di;

void main() async {
  await di.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<LoginBloc>(
        create: (_) => di.sl<LoginBloc>(),
      ),
      BlocProvider<SignupBloc>(
        create: (_) => di.sl<SignupBloc>(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) => AppRouter(),
    );
  }
}
