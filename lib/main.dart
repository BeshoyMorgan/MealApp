import 'package:flutter/material.dart';
import 'dummy_data2.dart';
import 'screens/category_meal_screen.dart';
import './screens/tabs_screen.dart';
import './screens/filters_screen.dart';
import 'screens/meal_detail_screen.dart';
import './models/meal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'Gluten': false,
    'Vegan': false,
    'Vegetarian': false,
    'Lactose': false,
  };
  List<Meal> _availableMeal = MEALS;
  List<Meal> _FavoriteMeals = [];

  void setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _availableMeal = MEALS.where((meal) {
        if (_filters['Gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['Vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['Vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['Lactose'] && !meal.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final favIndex = _FavoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (favIndex >= 0) {
      setState(() {
        _FavoriteMeals.removeAt(favIndex);
      });
    } else {
      setState(() {
        _FavoriteMeals.add(MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool isMealFavorite(String id) {
    return _FavoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => TabsScreen(_FavoriteMeals),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(_availableMeal),
        MealDetailScreen.routeName: (context) => MealDetailScreen(isMealFavorite, toggleFavorite),
        FiltersScreen.routeName: (context) => FiltersScreen(_filters, setFilters),
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline1: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
              headline2: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
