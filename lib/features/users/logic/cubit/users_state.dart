import 'package:equatable/equatable.dart';
import 'package:tafeel_task/features/users/data/models/single_user_model.dart';
import 'package:tafeel_task/features/users/data/models/users_model.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class GetAllUsersLoading extends UsersState {}

class GetAllUsersSuccess extends UsersState {
  final AllUsersModel users;
  const GetAllUsersSuccess({required this.users});
}

class GetAllUsersFailure extends UsersState {
  final String error;
  const GetAllUsersFailure({
    required this.error,
  });
}

class GetSingleUserLoading extends UsersState {}

class GetSingleUserSuccess extends UsersState {
  final SingleUserModel userModel;
  const GetSingleUserSuccess({required this.userModel});
}

class GetSingleUserFailure extends UsersState {
  final String error;
  const GetSingleUserFailure({
    required this.error,
  });
}
