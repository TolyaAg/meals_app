import 'package:flutter/material.dart';
import 'package:mealsapp/widget/meal_item.dart';

import '../dummy_data.dart';

class CategoryMeals extends StatelessWidget {
  static final routeName = '/category-meals';
//  final String categoryId;
//  final String categoryTitle;
//
//  CategoryMeals(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          final meal = categoryMeals[index];
          return MealItem(
            title: meal.title,
            duration: meal.duration,
            affordability: meal.affordability,
            imageUrl: meal.imageUrl,
            complexity: meal.complexity,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
