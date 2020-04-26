import 'package:flutter/material.dart';

import '../models/category.dart';

import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories;

  const CategoriesScreen({Key key, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deli Meals'),
      ),
      body: GridView(
        padding: EdgeInsets.all(15),
        children: categories
            .map((catData) => CategoryItem(
                  catData.id,
                  catData.title,
                  catData.color,
                ))
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
