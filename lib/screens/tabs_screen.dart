import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import './categories_screen.dart';
import './favorites_screen.dart';

import '../widgets/main_drawer.dart';

import '../dummy_data.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  State<StatefulWidget> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _tabPages;

  int selectedTabPageIndex = 0;

  void _selectTabPage(int value) {
    setState(() {
      selectedTabPageIndex = value;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabPages = [
      CategoriesScreen(categories: DUMMY_CATEGORIES),
      FavoritesScreen(widget.favoriteMeals),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Deli Meals'),
        ),
        drawer: MainDrawer(),
        body: _tabPages[selectedTabPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectTabPage,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: selectedTabPageIndex,
          //type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favorites'),
            ),
          ],
        ),
      ),
    );
  }
}
