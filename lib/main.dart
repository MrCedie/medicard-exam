import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicard_exam/core/config/bloc_provider.dart';
import 'package:medicard_exam/core/config/routes.dart';
import 'package:medicard_exam/feature/list/screens/list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.blockProviders(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.red,
          ),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            color: Colors.red,
          ),
          useMaterial3: true,
        ),
        initialRoute: ListScreen.routeName,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (context) => AppRoutes().generateRoute(settings),
          );
        },
      ),
    );
  }
}
