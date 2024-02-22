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
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.add_alert),
          tooltip: 'Show Snackbar',
          onPressed: () {},
        ),
      ],
    );
  }
}
