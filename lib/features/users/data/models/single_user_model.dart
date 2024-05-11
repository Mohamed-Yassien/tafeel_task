import 'package:equatable/equatable.dart';
import 'package:tafeel_task/features/users/data/models/users_model.dart';

class SingleUserModel extends Equatable {
  final UserData userData;

  const SingleUserModel({
    required this.userData,
  });

  factory SingleUserModel.fromJson(Map<String, dynamic> json) {
    return SingleUserModel(
      userData: UserData.fromJson(
        json['data'],
      ),
    );
  }

  @override
  List<Object?> get props => [userData];
}
