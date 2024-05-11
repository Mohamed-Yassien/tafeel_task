import 'package:dio/dio.dart';
import 'package:tafeel_task/core/endpoints.dart';
import 'package:tafeel_task/core/error/failure.dart';
import 'package:tafeel_task/core/helpers/dio_helper.dart';
import 'package:tafeel_task/features/users/data/models/single_user_model.dart';
import 'package:tafeel_task/features/users/data/models/users_model.dart';
import 'package:dartz/dartz.dart';

class UsersRepository {
  Future<Either<Failure, AllUsersModel>> getAllUsers(int pageNo) async {
    try {
      final response = await DioHelper.getData(
        url: Endpoints.getAllUsers,
        query: {
          "page": pageNo,
        },
      );
      return right(AllUsersModel.fromJson(response));
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  Future<Either<Failure, SingleUserModel>> getSingleUser(int userId) async {
    try {
      final response = await DioHelper.getData(
        url: "${Endpoints.getAllUsers}/$userId",
      );
      return right(SingleUserModel.fromJson(response));
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }
}
