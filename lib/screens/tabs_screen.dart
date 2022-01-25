import 'package:flutter/material.dart';
import 'category_scerrn.dart';
import 'favorite_screen.dart';
import '../widgets/drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  _TabsScreenState createState() => _TabsScreenState();
  final List<Meal> FavoritesMeals;
  TabsScreen(this.FavoritesMeals);
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _pageIndex = 0;
  _selectedPage(int value) {
    setState(() {
      _pageIndex = value;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': CategoryScreen(),
        'title': 'Categorues',
      },
      {
        'page': FavoriteScreen(widget.FavoritesMeals),
        'title': 'Your Favorites',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_pageIndex]['title']),
        centerTitle: true,
      ),
      body: _pages[_pageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
