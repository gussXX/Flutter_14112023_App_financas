import 'package:flutter/material.dart';

class ThisppBar {
  Function? context;
  String? pagetitle;

  AppBar thisAppBar({
    required BuildContext context,
    required String pagetitle,
  }) {
    return AppBar(
      title: Text(pagetitle, style: Theme.of(context).textTheme.bodyLarge),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
