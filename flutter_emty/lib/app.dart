import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_emty/app_bloc_providers.dart';
import 'package:flutter_emty/providers/main_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppBlocProviders(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<MainProvider>(
            create: (_) => MainProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<MainProvider>(
        builder: (context, value, child) => Center(
          child: Text('Button pressed ${value.count} times'),
        ),
      ),
      bottomNavigationBar: Consumer<MainProvider>(
        builder: (context, value, child) => BottomAppBar(
          child: ElevatedButton(
              onPressed: () {
                log('Button Pressed');
                value.increment();
              },
              child: const Text('Press Me')),
        ),
      ),
    );
  }
}
