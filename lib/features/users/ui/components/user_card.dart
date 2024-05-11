import 'package:flutter/material.dart';
import 'package:tafeel_task/core/routes.dart';
import 'package:tafeel_task/core/widgets/custom_text.dart';
import 'package:tafeel_task/core/widgets/reusable_circle_image.dart';
import 'package:tafeel_task/features/users/data/models/users_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.item,
  });

  final UserData item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.userDetailsScreen,
          arguments: PassIntArguments(
            item.id,
          ),
        );
      },
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(10),
          leading: ReusableCircleImage(image: item.avatar),
          title: CustomText(
            text: item.firstName + item.lastName,
            fontSize: 15,
          ),
          subtitle: CustomText(
            text: item.email,
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
