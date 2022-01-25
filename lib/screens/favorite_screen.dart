import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavoriteScreen extends StatefulWidget {
  _FavoriteScreenState createState() => _FavoriteScreenState();
  final List<Meal> FavoriteMeal;
  FavoriteScreen(this.FavoriteMeal);
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.FavoriteMeal.isEmpty) {
      return Center(
        child: Text('No Favorite Meal', style: Theme.of(context).textTheme.headline2),
      );
    } else {
      return ListView.builder(
        itemCount: widget.FavoriteMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.FavoriteMeal[index].id,
            imageUrl: widget.FavoriteMeal[index].imageUrl,
            title: widget.FavoriteMeal[index].title,
            duration: widget.FavoriteMeal[index].duration,
            complexity: widget.FavoriteMeal[index].complexity,
            affordability: widget.FavoriteMeal[index].affordability,
          );
        },
      );
    }
  }
}
