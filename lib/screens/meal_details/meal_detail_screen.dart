import 'package:flutter/material.dart';
import 'package:meals_app/data/meal.dart';
import 'package:meals_app/screens/meal_details/stateful_icon_button.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;
  final List<Meal> favorites;
  final void Function(Meal) onFavoriteMeal;

  const MealDetailScreen(
      {super.key,
      required this.meal,
      required this.favorites,
      required this.onFavoriteMeal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          StatefulIconButton(
              favorites: favorites,
              selectedMeal: meal,
              onFavoriteMeal: onFavoriteMeal)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              "Ingredients",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 8,
            ),
            ...meal.ingredients
                .map((e) => Text(
                      e,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ))
                .toList(),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Steps",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            ...meal.steps
                .map((e) => Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ))
                .toList()
          ],
        ),
      ),
    );
  }
}
