import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tafeel_task/core/widgets/custom_text.dart';
import 'package:tafeel_task/features/users/data/models/users_model.dart';
import 'package:tafeel_task/features/users/logic/cubit/users_cubit.dart';
import 'package:tafeel_task/features/users/logic/cubit/users_state.dart';
import 'package:tafeel_task/features/users/ui/components/users_list.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    var cubit = UsersCubit.get(context);
    cubit.pagingController = PagingController<int, UserData>(firstPageKey: 1);
    cubit.pagingController.addPageRequestListener((pageKey) async {
      await cubit.fetchPage(
        pageKey: pageKey,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          text: 'Users',
        ),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          var cubit = UsersCubit.get(context);
          return UsersList(cubit: cubit);
        },
      ),
    );
  }
}
