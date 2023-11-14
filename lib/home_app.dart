import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key, required this.pageTitle});
  final String pageTitle;

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp>  with WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
        backgroundColor: Colors.black,
      ),
      body: const Center(child: Text('Value'),),
    );
  }
}