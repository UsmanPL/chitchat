import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Native Button displays the Styled Button depending upon the Platform.

class NativeButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const NativeButton({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Platform.isIOS
      ? SizedBox(
          height: 55,
          width: double.infinity,
          child: CupertinoButton.filled(
            padding: EdgeInsets.zero,
            // color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
            onPressed: onTap,
            child: Text(
              title,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        )
      : ElevatedButton(
          onPressed: onTap,
          child: Text(title),
        );
}
