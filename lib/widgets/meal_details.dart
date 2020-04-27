import 'package:flutter/material.dart';

import '../models/meal.dart';

import './meal_item.dart';

class MealDetails extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final List<String> ingredients;
  final List<String> steps;

  const MealDetails(
      {Key key,
      @required this.id,
      @required this.title,
      @required this.imageUrl,
      @required this.duration,
      @required this.complexity,
      @required this.affordability,
      @required this.ingredients,
      @required this.steps})
      : super(key: key);

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Callenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Expensive';
        break;
      default:
        return 'Unknown costs';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          MealItem(
            id: id,
            title: title,
            imageUrl: imageUrl,
            duration: duration,
            complexity: complexity,
            affordability: affordability,
          ),
          buildTitle(context, 'Ingredients'),
          buildContainer(
            context: context,
            itemBuilder: (ctxt, index) {
              return Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(ingredients[index]),
                ),
              );
            },
            itemCount: ingredients.length,
          ),
          buildTitle(context, 'Steps'),
          buildContainer(
            context: context,
            itemBuilder: (ctxt, index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(
                        steps[index],
                      ),
                      //trailing: Divider(),
                    ),
                    Divider()
                  ],
                ),
              );
            },
            itemCount: steps.length,
          ),
        ],
      ),
    );
  }

  Container buildTitle(BuildContext context, String title) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(title, style: Theme.of(context).textTheme.title));
  }

  Container buildContainer(
      {BuildContext context, Function itemBuilder, int itemCount}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: itemCount,
      ),
    );
  }
}
