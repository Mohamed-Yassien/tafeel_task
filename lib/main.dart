import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafeel_task/core/helpers/dio_helper.dart';
import 'package:tafeel_task/core/routes.dart';
import 'package:tafeel_task/core/services/services_locator.dart';
import 'package:tafeel_task/features/users/logic/cubit/users_cubit.dart';

void main() {
  ServicesLocator.init();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsersCubit(sl()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.userScreen,
      ),
    );
  }
}
