
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tafeel_task/features/users/data/models/users_model.dart';
import 'package:tafeel_task/features/users/logic/cubit/users_cubit.dart';
import 'package:tafeel_task/features/users/ui/components/user_card.dart';

class UsersList extends StatelessWidget {
  const UsersList({
    super.key,
    required this.cubit,
  });

  final UsersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return PagedListView.separated(
      padding: const EdgeInsets.all(15.0),
      pagingController: cubit.pagingController,
      builderDelegate: PagedChildBuilderDelegate<UserData>(
        firstPageProgressIndicatorBuilder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        noItemsFoundIndicatorBuilder: (context) => const Text('no data'),
        itemBuilder: (_, item, index) {
          return UserCard(
            item: item,
          );
        },
      ),
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 7.0,
        );
      },
    );
  }
}
