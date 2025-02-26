import 'package:flutter/material.dart';
import 'package:film/screens/home_screen.dart';

void main() {
  runApp(const film());
}

class film extends StatelessWidget {
  const film({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Film',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
