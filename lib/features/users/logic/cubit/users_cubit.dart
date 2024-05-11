import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tafeel_task/features/users/data/models/users_model.dart';
import 'package:tafeel_task/features/users/data/repos/users_repository.dart';
import 'package:tafeel_task/features/users/logic/cubit/users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.usersRepository) : super(UsersInitial());

  final UsersRepository usersRepository;

  static UsersCubit get(context) => BlocProvider.of(context);

  PagingController<int, UserData> pagingController =
      PagingController<int, UserData>(firstPageKey: 1);
  Future<void> fetchPage({
    required int pageKey,
  }) async {
    var newList = await getAllUsers(
      pageKey,
    );

    if (newList != null) {
      var isLastPage = newList.totalPages == pageKey;

      if (isLastPage) {
        // stop
        pagingController.appendLastPage(newList.data ?? []);
      } else {
        // increase count to reach new page
        var nextPageKey = pageKey + 1;
        pagingController.appendPage(newList.data ?? [], nextPageKey);
      }
    }
  }

  Future<AllUsersModel?>? getAllUsers(int pageNo) async {
    final response = await usersRepository.getAllUsers(pageNo);
    late AllUsersModel allUsersModel;
    response.fold(
      (l) {
        emit(
          GetAllUsersFailure(
            error: l.errMessage,
          ),
        );
      },
      (r) {
        emit(
          GetAllUsersSuccess(
            users: r,
          ),
        );
        allUsersModel = r;
      },
    );
    return allUsersModel;
  }

  Future<void> getSingleUser(int userId) async {
    emit(GetSingleUserLoading());
    final response = await usersRepository.getSingleUser(userId);
    response.fold(
      (l) {
        emit(
          GetSingleUserFailure(
            error: l.errMessage,
          ),
        );
      },
      (r) {
        emit(
          GetSingleUserSuccess(
            userModel: r,
          ),
        );
      },
    );
  }
}
