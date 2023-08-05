import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  Category({required this.id, required this.title, this.color = Colors.orange});
}

class SettingsState {
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegatarianFree;
  bool isVeganFree;

  SettingsState(
      {this.isGlutenFree = false,
      this.isLactoseFree = false,
      this.isVegatarianFree = false,
      this.isVeganFree = false});
}
