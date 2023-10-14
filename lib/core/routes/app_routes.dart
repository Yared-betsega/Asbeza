import 'package:asbeza/asbeza.dart';

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
