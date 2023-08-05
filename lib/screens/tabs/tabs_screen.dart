import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/screens/categories/categories_screen.dart';
import 'package:meals_app/screens/meals/meals_screen.dart';
import 'package:meals_app/screens/settings/settings_screen.dart';
import 'package:meals_app/screens/tabs/drawer_screen.dart';
import '../../data/meal.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedIndex = 0;
  final List<String> titles = ["Categories", "Favorites"];
  final List<Meal> favorites = [];
  final SettingsState _settingState = SettingsState();
  final List<Meal> _availableMeals = [];

  @override
  void initState() {
    super.initState();
    _availableMeals.addAll(dummyMeals);
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

  void _onDrawerSelect(int index) async {
    Navigator.pop(context);
    if (index == 1) {
      var result = await Navigator.of(context).push<bool>(
        MaterialPageRoute(
          builder: (ctx) => SettingsScreen(
            settingState: _settingState,
          ),
        ),
      );
      if (result ?? false) {
        _callAvailableMeals();
      }
    }
  }

  void _onSelectFavoriteMeal(Meal meal) {
    setState(() {
      bool isExisted = favorites.contains(meal);
      if (isExisted) {
        _showSnackBar("${meal.title} is no longer favorite!");
        favorites.remove(meal);
      } else {
        _showSnackBar("${meal.title} is Added as a favorite!");
        favorites.add(meal);
      }
    });
  }

  void _onSelectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _callAvailableMeals() {
    setState(() {
      _availableMeals.clear();
      _availableMeals.addAll(dummyMeals.where((element) {
        if (_settingState.isGlutenFree && !element.isGlutenFree) {
          return false;
        }
        if (_settingState.isLactoseFree && !element.isLactoseFree) {
          return false;
        }
        if (_settingState.isVegatarianFree && !element.isVegetarian) {
          return false;
        }
        if (_settingState.isVeganFree && !element.isVegan) {
          return false;
        }
        return true;
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget selectedPage = CategoriesScreen(
      favorites: favorites,
      onFavoriteMeal: _onSelectFavoriteMeal,
      availableMeals: _availableMeals,
    );
    if (_selectedIndex == 1) {
      selectedPage = MealsScreen(
        meals: favorites,
        favorites: favorites,
        onFavoriteMeal: _onSelectFavoriteMeal,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(titles[_selectedIndex]),
      ),
      drawer: DrawerScreen(onDrawerSelect: _onDrawerSelect),
      body: selectedPage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onSelectPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: "Categories"),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: "Favorites")
        ],
      ),
    );
  }
}
