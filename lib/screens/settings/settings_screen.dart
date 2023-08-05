import 'package:flutter/material.dart';
import 'package:meals_app/models/Category.dart';
import 'package:meals_app/theme/theme.dart';

class SettingsScreen extends StatefulWidget {
  final SettingsState settingState;

  const SettingsScreen({super.key, required this.settingState});

  @override
  State<SettingsScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingsScreen> {
  void _onSwitchTileSelect(int index, bool state) {
    setState(() {
      if (index == 0) {
        widget.settingState.isGlutenFree = state;
      } else if (index == 1) {
        widget.settingState.isLactoseFree = state;
      } else if (index == 2) {
        widget.settingState.isVegatarianFree = state;
      } else {
        widget.settingState.isVeganFree = state;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(true);
        return false;
      },
      child: Scaffold(
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
              value: widget.settingState.isGlutenFree,
              onChanged: (value) => _onSwitchTileSelect(0, value),
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
              value: widget.settingState.isLactoseFree,
              onChanged: (value) => _onSwitchTileSelect(1, value),
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
              value: widget.settingState.isVegatarianFree,
              onChanged: (value) => _onSwitchTileSelect(2, value),
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
              value: widget.settingState.isVeganFree,
              onChanged: (value) => _onSwitchTileSelect(3, value),
            )
          ],
        ),
      ),
    );
  }
}
