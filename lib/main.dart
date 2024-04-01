import 'package:flutter/material.dart';
import 'package:renaudtest/pages/home_page.dart';
import 'package:renaudtest/pages/form_page.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomePage(),
        // '/form':(context)=>const FormPage(),
    },
    );
  }
}




