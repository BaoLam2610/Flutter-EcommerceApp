import 'package:flutter/material.dart';

class AspectRatioImage extends StatelessWidget {
  final double? ratio;
  final String image;
  final double? borderRadius;
  final BoxFit? fit;
  final Widget? child;

  const AspectRatioImage({
    super.key,
    this.ratio,
    this.fit,
    required this.image,
    this.child,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: ratio ?? 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
          image: DecorationImage(
            image: AssetImage(image),
            fit: fit,
          ),
        ),
        child: child,
      ),
    );
  }
}
