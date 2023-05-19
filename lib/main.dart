import 'package:flutter/material.dart';
import 'package:rand_users/views/users_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random User Generator',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.amber.shade50,
        primaryColor: Colors.amber.shade300,
      ),
      home: UsersView(),
    );
  }
}
