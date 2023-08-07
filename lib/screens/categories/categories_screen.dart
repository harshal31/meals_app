import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/screens/categories/category_grid_item.dart';
import 'package:meals_app/screens/meals/meals_screen.dart';
import '../../data/meal.dart';
import '../meal_details/meal_detail_screen.dart';

class CategoriesScreen extends StatefulWidget {
  final List<Meal> availableMeals;

  const CategoriesScreen({super.key, required this.availableMeals});

  @override
  State<CategoriesScreen> createState() => _CategoriesState();
}

class _CategoriesState extends State<CategoriesScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.forward();
  }

  void _onSelectCategory(BuildContext context, Category category) {
    var meals = widget.availableMeals
        .where((element) => element.categories.contains(category.id))
        .toList();
    if (meals.length == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) =>
              MealDetailScreen(
                meal: meals.first,
              ),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => MealsScreen(meals: meals, title: category.title),
        ),
      );
    }
  }

  /// The Animation which used here is the Explicit Animation.
  /// In this animation user has much control over animation.
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemCount: categories.length,
        itemBuilder: (ctx, index) =>
            CategoryGridItem(
              index: index,
              onSelectCategory: () =>
                  _onSelectCategory(context, categories[index]),
            ),
      ),
      builder: (ctx, child) =>
          SlideTransition(
            position: Tween(
              begin: const Offset(0, 1),
              end: const Offset(0, 0),
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.fastLinearToSlowEaseIn,
              ),
            ),
            child: child,
          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
}
