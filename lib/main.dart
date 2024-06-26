import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kan_lazim/firebase_options.dart';
import 'package:kan_lazim/screens/auth/login.dart';
import 'package:kan_lazim/screens/home/bottom_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: FirebaseService().userControll() ? const BottomNavBar() : const Login(),
    );
  }
}
