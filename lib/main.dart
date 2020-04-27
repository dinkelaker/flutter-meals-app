import 'package:flutter/material.dart';

import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/meal_details_screen.dart';

import 'dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (ctxt) => CategoriesScreen(categories: DUMMY_CATEGORIES),
        CategoryMealsScreen.routeName: (ctxt) => CategoryMealsScreen(),
        MealDetailsScreen.routeName: (ctxt) => MealDetailsScreen()
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) => CategoriesScreen(categories: DUMMY_CATEGORIES));
      // },
      onUnknownRoute: (settings) {
        final routeName = settings.name;
        final routeArgs = settings.arguments as Map<String, String>;

        print(
            'WARNING: Unknown page route "$routeName" with arguments "$routeArgs"');
        return MaterialPageRoute(
            builder: (context) =>
                CategoriesScreen(categories: DUMMY_CATEGORIES));
      },
    );
  }
}
