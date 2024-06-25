import 'package:flutter/material.dart';
import 'package:kan_lazim/screens/doners_list/doners_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const BloodDoners(),
    );
  }
}
