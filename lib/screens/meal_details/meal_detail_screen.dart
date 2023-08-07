import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/meal.dart';
import 'package:meals_app/providers/favorite/favorite_provider.dart';

class MealDetailScreen extends ConsumerWidget {
  final Meal meal;

  const MealDetailScreen({super.key, required this.meal});

  void _showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    ));
  }

  ///Implicit Animation example is present here as AnimatedSwitcher
  ///These are some available ImplicitAnimation widget https://docs.flutter.dev/ui/widgets/animation
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteMealProvider);
    final isFavorite = favorites.contains(meal);
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              final wasRemoved =
                  ref.read(favoriteMealProvider.notifier).toggleMealAsFavorite(meal);
              _showSnackBar(
                "Meal ${wasRemoved ? "removed" : "added"} as favorite",
                context,
              );
            },
            icon: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Icon(
                isFavorite ? Icons.star : Icons.star_outline,
                key: ValueKey(isFavorite),
              ),
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween<double>(begin: 0.7, end: 1).animate(animation),
                child: child,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: meal.id,
              child: Image.network(
                meal.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
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
