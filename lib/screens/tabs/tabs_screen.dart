import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/favorite/favorite_provider.dart';
import 'package:meals_app/providers/filter/fillters_provider.dart';
import 'package:meals_app/providers/tab/tab_provider.dart';
import 'package:meals_app/screens/categories/categories_screen.dart';
import 'package:meals_app/screens/meals/meals_screen.dart';
import 'package:meals_app/screens/settings/settings_screen.dart';
import 'package:meals_app/screens/tabs/drawer_screen.dart';

class TabScreen extends ConsumerWidget {
  TabScreen({super.key});

  final List<String> titles = ["Categories", "Favorites"];

  void _onDrawerSelect(int index, BuildContext context) {
    Navigator.pop(context);
    if (index == 1) {
      Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (ctx) => const SettingsScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteredMeals = ref.watch(filterMealProvider);
    final selectedIndex = ref.watch(tabProvider);

    Widget selectedPage = CategoriesScreen(
      favorites: ref.watch(favoriteMealProvider),
      availableMeals: filteredMeals,
    );

    if (selectedIndex == 1) {
      selectedPage = MealsScreen(
        meals: ref.watch(favoriteMealProvider),
        favorites: ref.watch(favoriteMealProvider),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[selectedIndex]),
      ),
      drawer: DrawerScreen(
          onDrawerSelect: (index) => _onDrawerSelect(index, context)),
      body: selectedPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => ref.read(tabProvider.notifier).updateTabIndex(index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
        ],
      ),
    );
  }
}
