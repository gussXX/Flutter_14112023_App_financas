// ignore_for_file: file_names

import 'package:flutter/material.dart'
    show FloatingActionButton, Icons, Theme, VoidCallback;
import 'package:flutter/widgets.dart';

//const Color(0xff325D55)

class FloatButton {
  Function? action;
  BuildContext? context;

  FloatingActionButton floatingActionButton({
    required VoidCallback action,
    required BuildContext context,
  }) {
    this.action = action;

    return FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.primary,
      onPressed: action,
      child: Icon(Icons.add, color: Theme.of(context).colorScheme.surface,)
    );
  }
}
