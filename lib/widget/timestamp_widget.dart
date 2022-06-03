
import 'package:flutter/material.dart';

class TimestampWidget extends StatelessWidget {
  const TimestampWidget({
    Key? key,
    required this.timestamp,
  }) : super(key: key);

  final String timestamp;

  @override
  Widget build(BuildContext context) {
    return Text(
      timestamp,
      style: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(color: Colors.white, shadows: [
        Shadow(
            offset: Offset(2, 2),
            blurRadius: 8.0,
            color: Colors.black.withAlpha(125)),
      ]),
    );
  }
}
