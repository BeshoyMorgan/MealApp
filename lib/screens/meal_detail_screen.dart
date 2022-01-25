import 'package:flutter/material.dart';
import 'package:helloworld/dummy_data2.dart';

class MealDetailScreen extends StatelessWidget {
  static const String routeName = 'MealDetailScreen';
  final Function toggleFavorite;
  final Function isMealFavorite;
  MealDetailScreen(this.isMealFavorite, this.toggleFavorite);
  Widget buildSectionTitle(BuildContext ctx, String sectionTitle) {
    return Container(
      child: Text(
        sectionTitle,
        textAlign: TextAlign.center,
        style: Theme.of(ctx).textTheme.headline6,
      ),
      padding: EdgeInsets.all(10),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      width: 400,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: ListView(
        children: [
          Card(
            elevation: 4,
            child: Container(
              height: 220,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          buildSectionTitle(context, 'Ingredients'),
          buildContainer(
            ListView.builder(
              itemCount: selectedMeal.ingredients.length,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    selectedMeal.ingredients[index],
                    style: Theme.of(context).textTheme.headline1,
                  ),
                );
              },
            ),
          ),
          buildSectionTitle(context, 'Steps'),
          buildContainer(
            ListView.builder(
              itemCount: selectedMeal.steps.length,
              itemBuilder: (ctx, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          selectedMeal.steps[index],
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isMealFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
