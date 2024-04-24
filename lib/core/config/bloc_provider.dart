import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicard_exam/feature/list/bloc/user_bloc.dart';

class AppBlocProviders {
  static List<BlocProvider> blockProviders() {
    return [
      BlocProvider<UserBloc>(
        create: (BuildContext context) => UserBloc(),
      ),
    ];
  }
}
