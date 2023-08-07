import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/theme/theme.dart';

import '../../providers/filter/fillters_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Column(
        children: [
          SwitchListTile(
            title: Text(
              "Gluten",
              style: context.textTheme().titleMedium,
            ),
            subtitle: Text(
              "Only include Gluten free meal!",
              style: context.textTheme().titleSmall,
            ),
            value: settingsState.isGlutenFree,
            onChanged: (value) => ref
                .read(filtersProvider.notifier)
                .updateSettingState(isGlutenFree: value),
          ),
          const SizedBox(
            height: 16,
          ),
          SwitchListTile(
            title: Text(
              "Lactose",
              style: context.textTheme().titleMedium,
            ),
            subtitle: Text(
              "Only include Lactose free meal!",
              style: context.textTheme().titleSmall,
            ),
            value: settingsState.isLactoseFree,
            onChanged: (value) => ref
                .read(filtersProvider.notifier)
                .updateSettingState(isLactoseFree: value),
          ),
          const SizedBox(
            height: 16,
          ),
          SwitchListTile(
            title: Text(
              "Vegetarian",
              style: context.textTheme().titleMedium,
            ),
            subtitle: Text(
              "Only include Vegetarian meal!",
              style: context.textTheme().titleSmall,
            ),
            value: settingsState.isVegatarianFree,
            onChanged: (value) => ref
                .read(filtersProvider.notifier)
                .updateSettingState(isVegatarianFree: value),
          ),
          const SizedBox(
            height: 16,
          ),
          SwitchListTile(
            title: Text(
              "Vegan",
              style: context.textTheme().titleMedium,
            ),
            subtitle: Text(
              "Only include Vegan meal!",
              style: context.textTheme().titleSmall,
            ),
            value: settingsState.isVeganFree,
            onChanged: (value) => ref
                .read(filtersProvider.notifier)
                .updateSettingState(isVeganFree: value),
          )
        ],
      ),
    );
  }
}
