import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class LoadingContainer extends StatelessWidget {
  final double height;
  final double? width;
  const LoadingContainer({super.key, required this.height,  this.width});


  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
    ), baseColor: Theme.of(context).colorScheme.background, highlightColor: Theme.of(context).colorScheme.primaryContainer);
  }
}
