import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';

class CategoryGridItem extends StatelessWidget {
  final int index;
  final void Function() onSelectCategory;

  const CategoryGridItem({super.key, required this.index, required this.onSelectCategory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.only(left: 10, top: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              categories[index].color.withOpacity(0.55),
              categories[index].color.withOpacity(0.9)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          categories[index].title,
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
