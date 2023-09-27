import 'package:asbeza/core/routes/app_routes.dart';
import 'package:asbeza/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:asbeza/features/authentication/presentation/bloc/signup/signup_bloc.dart';
import 'package:asbeza/features/home/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:asbeza/features/home/presentation/bloc/spend_bloc/spend_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import './core/injection/injection_container.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => di.sl<LoginBloc>()),
        BlocProvider<SignupBloc>(create: (_) => di.sl<SignupBloc>()),
        BlocProvider<HomeBloc>(create: (_) => di.sl<HomeBloc>()),
        BlocProvider<SpendBloc>(create: (_) => di.sl<SpendBloc>())
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) => AppRouter(),
      ),
    );
  }
}
