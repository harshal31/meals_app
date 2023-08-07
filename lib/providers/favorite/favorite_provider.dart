import 'package:meals_app/data/meal.dart';
import 'package:riverpod/riverpod.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  final List<Meal> _stateList = [];

  FavoriteMealsNotifier(super.state);

  bool toggleMealAsFavorite(Meal meal) {
    bool isFavorite = state.contains(meal);
    bool wadRemoved = false;
    if (isFavorite) {
      _stateList.remove(meal);
      wadRemoved = true;
    } else {
      _stateList.add(meal);
      wadRemoved = false;
    }
    state = [..._stateList];
    return wadRemoved;
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
        (ref) => FavoriteMealsNotifier([]));
