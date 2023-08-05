import 'package:flutter/material.dart';
import 'package:meals_app/data/meal.dart';

class StatefulIconButton extends StatefulWidget {
  final List<Meal> favorites;
  final Meal selectedMeal;
  final void Function(Meal) onFavoriteMeal;

  const StatefulIconButton(
      {super.key,
      required this.favorites,
      required this.selectedMeal,
      required this.onFavoriteMeal});

  @override
  State<StatefulWidget> createState() => _StatefulButtonIconState();
}

class _StatefulButtonIconState extends State<StatefulIconButton> {
  bool isFavorite = false;

  void _toggleIcon() {
    setState(() {
      isFavorite = !isFavorite;
      widget.onFavoriteMeal(widget.selectedMeal);
    });
  }

  @override
  void initState() {
    super.initState();
    isFavorite = widget.favorites.contains(widget.selectedMeal);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: _toggleIcon,
        icon: Icon(isFavorite ? Icons.star : Icons.star_outline));
  }
}
