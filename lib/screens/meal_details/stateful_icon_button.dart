import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/meal.dart';
import 'package:meals_app/providers/favorite/favorite_provider.dart';

class StatefulIconButton extends ConsumerStatefulWidget {
  final List<Meal> favorites;
  final Meal selectedMeal;

  const StatefulIconButton(
      {super.key, required this.favorites, required this.selectedMeal});

  @override
  ConsumerState<StatefulIconButton> createState() => _StatefulButtonIconState();
}

class _StatefulButtonIconState extends ConsumerState<StatefulIconButton> {
  bool isFavorite = false;

  void _toggleIcon() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    super.initState();
    isFavorite = widget.favorites.contains(widget.selectedMeal);
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          _toggleIcon();
          final wasRemoved = ref
              .read(favoriteMealProvider.notifier)
              .toggleMealAsFavorite(widget.selectedMeal);

          _showSnackBar("Meal ${wasRemoved ? "removed" : "added"} as favorite");
        },
        icon: Icon(isFavorite ? Icons.star : Icons.star_outline));
  }
}
