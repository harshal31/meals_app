import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/screens/categories/category_grid_item.dart';
import 'package:meals_app/screens/meals/meals_screen.dart';
import '../../data/meal.dart';
import '../meal_details/meal_detail_screen.dart';

class CategoriesScreen extends StatelessWidget {

  final List<Meal> availableMeals;
  final List<Meal> favorites;
  final void Function(Meal) onFavoriteMeal;

  const CategoriesScreen(
      {super.key, required this.favorites, required this.onFavoriteMeal, required this.availableMeals});

  void _onSelectCategory(BuildContext context, Category category) {
    var meals = availableMeals
        .where((element) => element.categories.contains(category.id))
        .toList();
    if (meals.length == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MealDetailScreen(
            meal: meals.first,
            favorites: favorites,
            onFavoriteMeal: onFavoriteMeal,
          ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(
            meals: meals,
            title: category.title,
            favorites: favorites,
            onFavoriteMeal: onFavoriteMeal,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemCount: categories.length,
      itemBuilder: (ctx, index) => CategoryGridItem(
          index: index,
          onSelectCategory: () =>
              _onSelectCategory(context, categories[index])),
    );
  }
}
