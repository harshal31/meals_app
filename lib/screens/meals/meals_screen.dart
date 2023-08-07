import 'package:flutter/material.dart';
import 'package:meals_app/data/meal.dart';
import 'package:meals_app/screens/meal_details/meal_detail_screen.dart';
import 'package:meals_app/screens/meals/meal_item.dart';
import 'package:meals_app/theme/theme.dart';

class MealsScreen extends StatelessWidget {
  final List<Meal> meals;
  String? title;

  MealsScreen({
    super.key,
    required this.meals,
    this.title
  });

  void _onMealSelection(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(
          meal: meal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget? mainContent;

    if (meals.isEmpty) {
      mainContent = Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Uh oh ... nothing here!",
              textAlign: TextAlign.center,
              style: context
                  .textTheme()
                  .headlineLarge
                  ?.apply(color: context.colorScheme().onSurface),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "Try selecting different category!",
              textAlign: TextAlign.center,
              style: context
                  .textTheme()
                  .bodyLarge
                  ?.apply(color: context.colorScheme().onSurface),
            ),
          ],
        ),
      );
    }

    if (meals.isNotEmpty) {
      mainContent = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealItem(
          meal: meals[index],
          onMealSelection: (meal) => _onMealSelection(context, meal),
        ),
      );
    }

    return title != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: Container(
              child: mainContent,
            ),
          )
        : Container(
            child: mainContent,
          );
  }
}
