import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicard_exam/core/entities/user.dart';
import 'package:medicard_exam/feature/form/screens/form_screen.dart';
import 'package:medicard_exam/feature/list/bloc/user_bloc.dart';
import 'package:medicard_exam/feature/list/bloc/user_state.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});
  static const routeName = 'list';
  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _handleNavigateForm(null, null),
        tooltip: 'Add User',
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.usersList.length,
            itemBuilder: (context, index) {
              UserEntity data = state.usersList[index];
              String name = "${data.firstName} ${data.lastName}";

              return ListTile(
                tileColor: index.isEven ? Colors.white : Colors.grey[200],
                title: Text(name),
                onTap: () => _handleNavigateForm(data, index),
              );
            },
          );
        },
      ),
    );
  }

  _handleNavigateForm(UserEntity? data, int? index) {
    Navigator.pushNamed(
      context,
      FormScreen.routeName,
      arguments: FormScreenArgs(
        user: data,
        index: index,
      ),
    );
  }
}
