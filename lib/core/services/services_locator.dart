import 'package:get_it/get_it.dart';
import 'package:tafeel_task/features/users/data/repos/users_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  static void init() {
    sl.registerLazySingleton<UsersRepository>(
      () => UsersRepository(),
    );
  }
}
