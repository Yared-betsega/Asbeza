import 'package:asbeza/core/constants/colors.dart';
import 'package:asbeza/features/authentication/presentation/screens/login_page..dart';
import 'package:asbeza/features/authentication/presentation/screens/signup_page.dart';
import 'package:asbeza/features/home/presentation/screens/home_page.dart';
import 'package:asbeza/features/onboarding_screens/onboarding_screen.dart';
import 'package:asbeza/features/onboarding_screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_paths.dart';

class AppRouter extends StatelessWidget {
  late final GoRouter _router;

  AppRouter({Key? key}) : super(key: key) {
    _router = GoRouter(
      initialLocation: RoutePaths.splash,
      routes: <GoRoute>[
        GoRoute(
          path: RoutePaths.splash,
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreen(),
        ),
        GoRoute(
          path: RoutePaths.onboardingPage,
          builder: (BuildContext context, GoRouterState state) =>
              const Onboarding(),
        ),
        GoRoute(
          path: RoutePaths.home,
          builder: (BuildContext context, GoRouterState state) =>
              const HomePage(),
        ),

        // GoRoute(
        //   path: RoutePaths.signUp,
        //   builder: (BuildContext context, GoRouterState state) =>
        //       const SignUpPage(),
        // ),
        GoRoute(
          path: RoutePaths.login,
          builder: (BuildContext context, GoRouterState state) =>
              const LoginPage(),
        ),
        GoRoute(
          path: RoutePaths.signUp,
          builder: (BuildContext context, GoRouterState state) =>
              const SignupPage(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        theme: ThemeData(
          primaryColor: primaryColor,
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
      );
}
