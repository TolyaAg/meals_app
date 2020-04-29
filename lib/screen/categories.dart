import 'package:flutter/material.dart';

import 'package:mealsapp/dummy_data.dart';

import 'package:mealsapp/widget/category_item.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'),
      ),
      body: GridView(
        padding: EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 15,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (data) => CategoryItem(
                data.id,
                data.title,
                data.color,
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
