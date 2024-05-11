import 'package:equatable/equatable.dart';

class AllUsersModel extends Equatable {
  final int page;
  final int totalPages;
  final List<UserData>? data;

  const AllUsersModel({
    required this.page,
    required this.totalPages,
    required this.data,
  });

  factory AllUsersModel.fromJson(Map<String, dynamic> json) {
    return AllUsersModel(
      page: json['page'],
      totalPages: json['total_pages'],
      data: json['data'] != null
          ? List<UserData>.from(
              json['data'].map(
                (data) => UserData.fromJson(
                  data,
                ),
              ),
            )
          : null,
    );
  }

  @override
  List<Object?> get props => [page, totalPages, data];
}

class UserData extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const UserData({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  @override
  List<Object?> get props => [id, email, firstName, lastName, avatar];
}
