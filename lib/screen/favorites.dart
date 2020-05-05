import 'package:flutter/material.dart';
import 'package:mealsapp/models/meal.dart';
import 'package:mealsapp/widget/meal_item.dart';

class Favorites extends StatelessWidget {
  final List<Meal> favoriteMeals;

  Favorites(this.favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = favoriteMeals[index];
          return MealItem(
            id: meal.id,
            title: meal.title,
            duration: meal.duration,
            affordability: meal.affordability,
            imageUrl: meal.imageUrl,
            complexity: meal.complexity,
          );
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
