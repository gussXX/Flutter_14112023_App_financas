// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class KeepAliveFutureBuilder extends StatefulWidget {

  final Future future;
  final AsyncWidgetBuilder builder;

  const KeepAliveFutureBuilder({super.key, 
    required this.future,
    required this.builder
  });

  @override
  _KeepAliveFutureBuilderState createState() {
    return _KeepAliveFutureBuilderState();
  }
}

class _KeepAliveFutureBuilderState extends State<KeepAliveFutureBuilder> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
      future: widget.future,
      builder: widget.builder,
    );
  }

  @override
  bool get wantKeepAlive => true;
}