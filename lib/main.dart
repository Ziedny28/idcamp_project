import 'package:flutter/material.dart';
import 'package:idcamp_project/home.dart';
import 'package:idcamp_project/providers/cart_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: const SafeArea(
        child: MaterialApp(
          title: 'Flutter Demo',
          home: Home(),
        ),
      ),
    );
  }
}
