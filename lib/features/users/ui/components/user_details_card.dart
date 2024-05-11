
import 'package:flutter/material.dart';
import 'package:tafeel_task/core/widgets/custom_text.dart';
import 'package:tafeel_task/core/widgets/reusable_circle_image.dart';
import 'package:tafeel_task/features/users/data/models/users_model.dart';

class UserDetailsCard extends StatelessWidget {
  const UserDetailsCard({
    super.key,
    required this.userData,
  });
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ReusableCircleImage(
                image: userData.avatar,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                text: '${userData.firstName} ${userData.lastName}',
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              CustomText(
                text: userData.email,
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
