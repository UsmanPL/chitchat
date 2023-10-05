import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageTile extends StatelessWidget {
  final String imageUrl;
  final double size;
  final double? borderRadius;

  const ImageTile(
      {super.key,
      required this.imageUrl,
      required this.size,
      this.borderRadius});

  @override
  Widget build(BuildContext context) => CachedNetworkImage(
        imageUrl: imageUrl,
        imageBuilder: (_, imageProvider) => Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 90),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
        placeholder: (_, __) => ImageShimmer(
          height: size,
          width: size,
          border: borderRadius ?? 90,
        ),
        errorWidget: (_, __, ___) => NoImageTile(
          height: size,
          width: size,
          border: borderRadius ?? 90,
        ),
      );
}

class ImageShimmer extends StatelessWidget {
  final double height;
  final double width;
  final double border;

  const ImageShimmer(
      {Key? key,
      required this.height,
      required this.width,
      required this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        width: width,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: const Color(0xFFF2F2F2),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(border),
            ),
          ),
        ),
      );
}

class NoImageTile extends StatelessWidget {
  final double height;
  final double width;
  final double border;

  const NoImageTile(
      {Key? key,
      required this.height,
      required this.width,
      required this.border})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(border),
        ),
        child: const FittedBox(
          fit: BoxFit.scaleDown,
          child: Icon(
            Icons.person,
            size: 60,
            color: Colors.white,
          ),
        ),
      );
}
