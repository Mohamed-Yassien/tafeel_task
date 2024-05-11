import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafeel_task/core/widgets/custom_text.dart';
import 'package:tafeel_task/features/users/logic/cubit/users_cubit.dart';
import 'package:tafeel_task/features/users/logic/cubit/users_state.dart';
import 'package:tafeel_task/features/users/ui/components/user_details_card.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({super.key, required this.userId});

  final int userId;
  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var cubit = UsersCubit.get(context);
      await cubit.getSingleUser(widget.userId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is GetSingleUserFailure) {
            return Center(
              child: CustomText(
                text: state.error,
              ),
            );
          } else if (state is GetSingleUserSuccess) {
            return UserDetailsCard(
              userData: state.userModel.userData,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        },
      ),
    );
  }
}
