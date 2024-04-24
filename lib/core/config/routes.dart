import 'package:flutter/material.dart';
import 'package:medicard_exam/feature/form/screens/form_screen.dart';
import 'package:medicard_exam/feature/list/screens/list_screen.dart';

class AppRoutes {
  generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case ListScreen.routeName:
        return const ListScreen();
      case FormScreen.routeName:
        final params = args as FormScreenArgs?;
        return FormScreen(args: params);
      default:
        return const ListScreen();
    }
  }
}
