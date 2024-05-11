import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tafeel_task/core/widgets/custom_text.dart';
import 'package:tafeel_task/features/users/ui/screens/users_screen.dart';
import 'package:tafeel_task/features/users/ui/screens/user_details_screen.dart';

class Routes {
  static const String userScreen = "/";
  static const String userDetailsScreen = "/userDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.userScreen:
        return MaterialPageRoute(
          builder: (context) => const UsersScreen(),
        );
      case Routes.userDetailsScreen:
        return MaterialPageRoute(
          builder: (context) {
            var args = routeSettings.arguments as PassIntArguments;
            return UserDetailsScreen(
              userId: args.id,
            );
          },
        );

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("مسار غير موجود"),
        ),
        body: const Center(
          child: CustomText(
            text: "مسار غير موجود",
          ),
        ),
      ),
    );
  }
}

class PassIntArguments extends Equatable {
  final int id;
  const PassIntArguments(this.id);

  @override
  List<Object?> get props => [id];
}
