import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MyDrawer extends StatelessWidget {
  Widget buildListTile(BuildContext context, IconData icon, String text, Function onTapHandller) {
    return ListTile(
      onTap: onTapHandller,
      leading: Icon(icon, size: 20),
      title: Text(text, style: Theme.of(context).textTheme.headline2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        Card(
          elevation: 4,
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            width: double.infinity,
            height: 100,
            color: Colors.grey.withOpacity(0.5),
            child: Text('Meal UP', style: Theme.of(context).textTheme.headline6),
          ),
        ),
        buildListTile(context, Icons.restaurant, 'Meal', () {
          Navigator.of(context).pushNamed('/');
        }),
        SizedBox(height: 10),
        buildListTile(context, Icons.settings, 'Filters', () {
          Navigator.of(context).pushNamed(FiltersScreen.routeName);
        }),
      ],
    ));
  }
}
