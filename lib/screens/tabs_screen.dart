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
  final List<Widget> _tabPages = [
    CategoriesScreen(categories: DUMMY_CATEGORIES),
    FavoritesScreen(),
  ];

  int selectedTabPageIndex = 0;

  void _selectTabPage(int value) {
    setState(() {
      selectedTabPageIndex = value;
    });
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
