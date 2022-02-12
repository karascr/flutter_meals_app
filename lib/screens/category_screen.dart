import 'package:flutter/material.dart';

import '/dummy_data.dart';
import '/models/meal.dart';
import '/widgets/meal_item.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = "/category";
  const CategoryScreen({Key? key, required this.availableMeals})
      : super(key: key);

  final List<Meal> availableMeals;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String id = routeArgs["id"] ?? "";
    final String title = routeArgs["title"] ?? "";
    final List<Meal> catMeals =
        availableMeals.where((meal) => meal.categories.contains(id)).toList();

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        itemBuilder: (context, i) {
          return MealItem(
            meal: catMeals[i],
          );
        },
        itemCount: catMeals.length,
      ),
    );
  }
}
