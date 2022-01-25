import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final id;
  final imageUrl;
  final String title;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem({
    @required this.id,
    @required this.imageUrl,
    @required this.title,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
        defult:
        return 'UnKnown';
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
        return 'Luxurious';
        break;
        defult:
        return 'UnKnown';
    }
  }

  void selectedMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectedMeal(context),
      child: Card(
        elevation: 5,
        margin: EdgeInsets.all(15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                    ),
                    width: 200,
                    padding: EdgeInsets.all(10),
                    child: Text(title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5),
                      Text(affordabilityText),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
