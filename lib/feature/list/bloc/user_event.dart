import 'package:equatable/equatable.dart';
import 'package:medicard_exam/core/entities/user.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  List<Object?> get props => [];
}

class AddUserEvent extends UserEvent {
  final UserEntity user;
  const AddUserEvent(this.user);
  @override
  List<Object?> get props => [user];
}

class UpdateUserEvent extends UserEvent {
  final UserEntity user;
  final int index;

  const UpdateUserEvent(this.user, this.index);
  @override
  List<Object?> get props => [user];
}

class DeleteUserEvent extends UserEvent {
  final int index;
  const DeleteUserEvent(this.index);
  @override
  List<Object?> get props => [index];
}
