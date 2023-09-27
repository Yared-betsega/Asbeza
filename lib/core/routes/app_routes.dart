import 'package:asbeza/core/constants/colors.dart';
import 'package:asbeza/features/authentication/presentation/screens/auth_page.dart';
import 'package:asbeza/features/authentication/presentation/screens/login_page..dart';
import 'package:asbeza/features/authentication/presentation/screens/login_sign_up_toggler.dart';
import 'package:asbeza/features/authentication/presentation/screens/signup_page.dart';
import 'package:asbeza/features/home/presentation/screens/debt_history_details_screen.dart';
import 'package:asbeza/features/home/presentation/screens/home_page.dart';
import 'package:asbeza/features/home/presentation/screens/transaction_history_detail_screen.dart';
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
          path: RoutePaths.auth,
          builder: (BuildContext context, GoRouterState state) =>
              const AuthPage(),
        ),
        GoRoute(
          path: RoutePaths.authScreens,
          builder: (BuildContext context, GoRouterState state) =>
              const LoginSignUPToggler(),
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
            routes: [
              GoRoute(
                path: RoutePaths.transactionHistoryDetails,
                builder: (BuildContext context, GoRouterState state) =>
                    const TransactionHistoryDetails(),
              ),
              GoRoute(
                path: RoutePaths.debtHistoryDetails,
                builder: (BuildContext context, GoRouterState state) =>
                    const DebtHistoryDetails(),
              ),
            ]),

        // GoRoute(
        //   path: RoutePaths.signUp,
        //   builder: (BuildContext context, GoRouterState state) =>
        //       const SignUpPage(),
        // ),
        GoRoute(
            path: RoutePaths.login,
            builder: (BuildContext context, GoRouterState state) {
              var extra = state.extra as Map<String, dynamic>;
              return LoginPage(
                showSignupPage: extra['showSignupPage'],
              );
            }),
        GoRoute(
            path: RoutePaths.signUp,
            builder: (BuildContext context, GoRouterState state) {
              var extra = state.extra as Map<String, dynamic>;
              return SignupPage(
                showLoginPage: extra['showSignupPage'],
              );
            }),
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
