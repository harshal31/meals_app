import 'package:flutter/material.dart';
import 'package:meals_app/theme/theme.dart';

class DrawerScreen extends StatelessWidget {

  final void Function(int) onDrawerSelect;

  const DrawerScreen({super.key, required this.onDrawerSelect});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  context.colorScheme().primaryContainer,
                  context.colorScheme().primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(Icons.fastfood,
                    size: 48, color: context.colorScheme().primary),
                const SizedBox(
                  width: 18,
                ),
                Text(
                  "Cooking Up!",
                  style: context
                      .textTheme()
                      .titleLarge
                      ?.copyWith(color: context.colorScheme().primary),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () => onDrawerSelect(0),
            leading: Icon(
              Icons.restaurant,
              size: 26,
              color: context.colorScheme().onBackground,
            ),
            title: Text(
              "Meals",
              style: context
                  .textTheme()
                  .headlineSmall
                  ?.copyWith(color: context.colorScheme().onBackground),
            ),
          ),
          ListTile(
            onTap: () => onDrawerSelect(1),
            leading: Icon(
              Icons.settings,
              size: 26,
              color: context.colorScheme().onBackground,
            ),
            title: Text(
              "Settings",
              style: context
                  .textTheme()
                  .headlineSmall
                  ?.copyWith(color: context.colorScheme().onBackground),
            ),
          )
        ],
      ),
    );
  }
}
