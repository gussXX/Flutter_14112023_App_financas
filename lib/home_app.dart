import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key, required this.pageTitle});
  final String pageTitle;

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> with WidgetsBindingObserver {
  @override
  void initState() {
    print(ThemeMode.system.index);
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
        title: Text(widget.pageTitle,
            style: Theme.of(context).textTheme.bodyLarge),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: const Center(
        child: Text('Value'),
      ),
    );
  }
}
