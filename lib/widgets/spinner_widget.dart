import 'package:flutter/material.dart';

enum SpinnerSize { small, medium, large }
class SpinnerWidget extends StatelessWidget {

  final SpinnerSize size;
  final Color? color;

  const SpinnerWidget({
    super.key,
    required this.size,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size == SpinnerSize.small ? 24 : size == SpinnerSize.medium ? 48 : 72,
      height: size == SpinnerSize.small ? 24 : size == SpinnerSize.medium ? 48 : 72,
      child: CircularProgressIndicator(
        strokeWidth: size == SpinnerSize.small ? 4 : size == SpinnerSize.medium ? 6 : 8,
        color: color ?? Colors.white
      ),
      );
  }
}