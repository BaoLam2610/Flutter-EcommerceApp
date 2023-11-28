import 'package:flutter/material.dart';

class TileStatefulWidget<T> extends StatefulWidget {
  final T data;
  final int? position;

  const TileStatefulWidget({
    super.key,
    required this.data,
    this.position,
  });

  @override
  State<TileStatefulWidget> createState() => TileState();
}

class TileState<T extends TileStatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}

class TileStatelessWidget<T> extends StatelessWidget {
  final T data;
  final int? position;

  const TileStatelessWidget({
    super.key,
    required this.data,
    this.position,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
