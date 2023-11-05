import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomOrderInfoItem extends StatelessWidget {
  final String title, value;
  CustomOrderInfoItem({
    super.key,
    required this.title,
    required this.value,
    required this.style,
  });

  TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: style,
        ),
        const Spacer(),
        Text(
          value,
          textAlign: TextAlign.center,
          style: style,
        )
      ],
    );
  }
}
