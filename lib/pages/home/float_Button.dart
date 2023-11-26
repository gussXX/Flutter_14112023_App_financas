import 'package:flutter/material.dart'
    show Color, FloatingActionButton, VoidCallback;

//const Color(0xff325D55)

class FloatButton {
  Function? action;
  Color? colors;

  FloatingActionButton floatingActionButton({
    required VoidCallback action,
    required Color colors,
  }) {
    this.action = action;
    this.colors = colors;

    return FloatingActionButton(
      backgroundColor: colors,
      onPressed: action,
    );
  }
}
