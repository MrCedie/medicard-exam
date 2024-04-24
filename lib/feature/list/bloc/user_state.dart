import 'package:equatable/equatable.dart';
import 'package:medicard_exam/core/entities/user.dart';

class UserState extends Equatable {
  final List<UserEntity> usersList;

  const UserState(this.usersList);

  @override
  List<Object?> get props => [usersList];
}
