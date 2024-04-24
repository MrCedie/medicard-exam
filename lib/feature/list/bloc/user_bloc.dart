import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicard_exam/core/entities/user.dart';
import 'package:medicard_exam/feature/list/bloc/user_event.dart';
import 'package:medicard_exam/feature/list/bloc/user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserState(initialState)) {
    on<AddUserEvent>(_addUserEvent);
    on<UpdateUserEvent>(_updateUserEvent);
    on<DeleteUserEvent>(_deleteUserEvent);
  }

  FutureOr<void> _deleteUserEvent(
    DeleteUserEvent event,
    Emitter<UserState> emit,
  ) {
    List<UserEntity> data = [...state.usersList];
    data.removeAt(event.index);
    emit(UserState(data));
  }

  FutureOr<void> _updateUserEvent(
    UpdateUserEvent event,
    Emitter<UserState> emit,
  ) {
    List<UserEntity> data = List.generate(state.usersList.length, (index) {
      if (index == event.index) {
        return event.user;
      }

      return state.usersList[index];
    });
    emit(UserState(data));
  }

  FutureOr<void> _addUserEvent(
    AddUserEvent event,
    Emitter<UserState> emit,
  ) {
    emit(UserState([
      event.user,
      ...state.usersList,
    ]));
  }
}

const List<UserEntity> initialState = [
  UserEntity(
    firstName: 'Elmo',
    middleName: "Sadsad",
    lastName: "langcap",
    email: "elmolangcap@gmail.com",
  ),
  UserEntity(
    firstName: 'John',
    middleName: "",
    lastName: "Doe",
    email: "johndoe@gmail.com",
  ),
  UserEntity(
    firstName: 'ash',
    middleName: "",
    lastName: "ketchump",
    email: "ashketchump@gmail.com",
  ),
  UserEntity(
    firstName: 'Jane',
    middleName: "qwerty",
    lastName: "Doe",
    email: "janedoe@gmail.com",
  ),
  UserEntity(
    firstName: 'miguel',
    middleName: "brock",
    lastName: "swarez",
    email: "miguelswarez@gmail.com",
  ),
];
