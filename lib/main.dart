import 'package:flutter/material.dart';
import 'package:kingscut/screens/logo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: LogoPage(), debugShowCheckedModeBanner: false);
  }
}
