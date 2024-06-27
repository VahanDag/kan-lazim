import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kan_lazim/firebase_options.dart';
import 'package:kan_lazim/screens/auth/login.dart';
import 'package:kan_lazim/screens/home/bottom_bar.dart';
<<<<<<< HEAD
import 'package:kan_lazim/screens/profile/profile.dart';
import 'package:kan_lazim/screens/splash/splash.dart';
=======
import 'package:kan_lazim/services/firebase_service.dart';
>>>>>>> ca34135c4943c4cad1bd65c0c2c99e5b67c28360

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
