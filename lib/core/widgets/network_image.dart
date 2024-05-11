import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImagesWidgets extends StatelessWidget {
  const NetworkImagesWidgets(
    this.url, {
    super.key,
    this.fit,
    this.width,
    this.height,
    this.radius,
  });
  final String url;
  final double? width;
  final double? height;
  final double? radius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: SizedBox(
        width: width,
        height: height,
        child: CachedNetworkImage(
          progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator.adaptive(
                value: downloadProgress.progress,
              ),
            ),
          ),
          fit: fit,
          imageUrl: url,
          errorWidget: (context, _, __) => Image.network(
            "https://tse1.mm.bing.net/th?id=OIP.cmTcUqX-2WFqJofdiwQLBQHaHa&pid=Api",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
