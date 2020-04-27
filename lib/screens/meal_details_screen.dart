import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';

import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final selectedMealTitle = routeArgs['title'];
    final selectedMealId = routeArgs['id'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == selectedMealId;
    });
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMealTitle),
      ),
      body: 
          MealItem(
            id: selectedMeal.id,
            title: selectedMeal.title,
            imageUrl: selectedMeal.imageUrl,
            complexity: selectedMeal.complexity,
            affordability: selectedMeal.affordability,
            duration: selectedMeal.duration
          ),
    );
  }
}
