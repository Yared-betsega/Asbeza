import 'package:asbeza/asbeza.dart';

import './core/injection/injection_container.dart' as di;

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
