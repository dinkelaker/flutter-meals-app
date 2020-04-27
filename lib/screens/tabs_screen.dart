import 'package:flutter/material.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

import '../dummy_data.dart';

class TabsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Deli Meals'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(icon: Icon(Icons.star), text: 'Favorites')
            ],
          ),
        ),
        body: TabBarView(children: <Widget>[
          CategoriesScreen(categories: DUMMY_CATEGORIES),
          FavoritesScreen(),
        ])
      ),
    );
  }
}
