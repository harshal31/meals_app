import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/meal/meal_provider.dart';

class SettingsState {
  bool isGlutenFree;
  bool isLactoseFree;
  bool isVegatarianFree;
  bool isVeganFree;

  SettingsState({
    this.isGlutenFree = false,
    this.isLactoseFree = false,
    this.isVegatarianFree = false,
    this.isVeganFree = false,
  });
}

class FilterNotifier extends StateNotifier<SettingsState> {
  FilterNotifier(super.state);

  void updateSettingState({
    bool? isGlutenFree,
    bool? isLactoseFree,
    bool? isVeganFree,
    bool? isVegatarianFree,
  }) {
    final settingState = SettingsState();
    settingState.isGlutenFree = isGlutenFree ?? state.isGlutenFree;
    settingState.isLactoseFree = isLactoseFree ?? state.isLactoseFree;
    settingState.isVeganFree = isVeganFree ?? state.isVeganFree;
    settingState.isVegatarianFree = isVegatarianFree ?? state.isVegatarianFree;
    state = settingState;
  }
}

final filtersProvider = StateNotifierProvider<FilterNotifier, SettingsState>(
    (ref) => FilterNotifier(SettingsState()));

final filterMealProvider = Provider((ref) {
  final meals = ref.read(mealProvider);
  final settingState = ref.watch(filtersProvider);
  return meals.where((element) {
    if (settingState.isGlutenFree && !element.isGlutenFree) {
      return false;
    }
    if (settingState.isLactoseFree && !element.isLactoseFree) {
      return false;
    }
    if (settingState.isVegatarianFree && !element.isVegetarian) {
      return false;
    }
    if (settingState.isVeganFree && !element.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
