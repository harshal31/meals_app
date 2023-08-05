import 'package:flutter/material.dart';
import 'package:meals_app/screens/tabs/tabs_screen.dart';
import 'package:meals_app/theme/theme.dart';

void main() {
  runApp(
    const SafeArea(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meals App',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      home: const TabScreen(),
    );
  }
}
// MealsScreen(category: Category(id: "c2", title: "")
