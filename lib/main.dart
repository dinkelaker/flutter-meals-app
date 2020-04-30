import 'package:flutter/material.dart';

import './models/meal.dart';

import './screens/tabs_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_details_screen.dart';
import './screens/filter_screen.dart';

import './dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'vegetarian': false,
    'vegan': false,
    'lactose': false,
  };

  void _setFilters(Map<String, bool> filters) {
    setState(() {
      this.filters = filters;

      _availableMeals = DUMMY_MEALS.where((meals) {
        return (!filters['gluten'] || meals.isGlutenFree) &&
            (!filters['vegetarian'] || meals.isVegetarian) &&
            (!filters['vegan'] || meals.isVegan) &&
            (!filters['lactose'] || meals.isLactoseFree);
      }).toList();
    });
  }

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deli Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            body2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            title: TextStyle(
              fontSize: 24,
              //fontFamily: 'RobotoCondensed',
            )),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctxt) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctxt) => CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (ctxt) => MealDetailsScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctxt) => FiltersScreen(filters, _setFilters),
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) => CategoriesScreen(categories: DUMMY_CATEGORIES));
      // },
      onUnknownRoute: (settings) {
        final routeName = settings.name;
        final routeArgs = settings.arguments as Map<String, String>;

        print(
            'WARNING: Unknown page route "$routeName" with arguments "$routeArgs"');
        return MaterialPageRoute(builder: (context) => TabsScreen(_favoriteMeals));
      },
    );
  }
}
