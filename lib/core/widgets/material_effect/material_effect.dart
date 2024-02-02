import 'package:flutter/material.dart';

class MaterialEffect extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double elevation;
  final BorderRadius? borderRadius;
  final void Function()? onTap;

  const MaterialEffect({
    super.key,
    required this.child,
    required this.onTap,
    this.elevation = 0.0,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      elevation: elevation,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
