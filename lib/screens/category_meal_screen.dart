import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const String routeName = 'category_meal';
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
  final List updatedMeals;
  CategoryMealScreen(this.updatedMeals);
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
  Widget build(BuildContext context) {
    final routeArg = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];
    final categoryMeals = widget.updatedMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeals[index].id,
            imageUrl: categoryMeals[index].imageUrl,
            title: categoryMeals[index].title,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
          );
        },
      ),
    );
  }
}
