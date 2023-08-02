import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/theme/theme.dart';

class MealsScreen extends StatelessWidget {
  final Category category;

  const MealsScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    var meals =
        dummyMeals.where((element) => element.categories.contains(category.id));
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
      mainContent = Center(
        child: Text("Category is ${meals.firstOrNull?.title}"),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select your meals"),
      ),
      body: Container(
        child: mainContent,
      ),
    );
  }
}
