
import 'package:flutter/material.dart';
import 'package:tafeel_task/core/widgets/network_image.dart';

class ReusableCircleImage extends StatelessWidget {
  const ReusableCircleImage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      clipBehavior: Clip.antiAlias,
      width: 70,
      height: 70,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: NetworkImagesWidgets(
       image,
        fit: BoxFit.fill,
      ),
    );
  }
}
