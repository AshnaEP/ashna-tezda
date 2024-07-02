import 'package:flutter/material.dart';
import 'package:task/feature/auth/sing_in_tab.dart';
import 'package:task/feature/product/product_list_screen.dart';
import 'package:task/feature/user/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignInTab(),
    );
  }
}

