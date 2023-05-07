
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScanButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onLongPress;
  final VoidCallback onLongPressUp;

  const ScanButton({
    super.key,
    required this.child,
    required this.onLongPress,
    required this.onLongPressUp,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      onLongPressUp: onLongPressUp,
      child: Platform.isAndroid
          ? ElevatedButton(
              child: child,
              onPressed: () => {},
            )
          : CupertinoButton(
              child: child,
              onPressed: () {},
            ),
    );
  }
}
