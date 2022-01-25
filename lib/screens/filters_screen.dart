import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  _FiltersScreenState createState() => _FiltersScreenState();
  static const String routeName = 'filter_screen';
  final Function saveFilters;
  final Map<String, bool> _currentFilter;
  FiltersScreen(this._currentFilter, this.saveFilters);
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;
  @override
  void didChangeDependencies() {
    _isGlutenFree = widget._currentFilter['Gluten'];
    _isVegan = widget._currentFilter['Vegan'];
    _isVegetarian = widget._currentFilter['Vegetarian'];
    _isLactoseFree = widget._currentFilter['Lactose'];

    super.didChangeDependencies();
  }

  Widget buildSwitchListTile(String title, String description, bool value, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description),
      value: value,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final _selectedFilters = {
                'Gluten': _isGlutenFree,
                'Vegan': _isVegan,
                'Vegetarian': _isVegetarian,
                'Lactose': _isLactoseFree,
              };
              widget.saveFilters(_selectedFilters);
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Text(
            'Adjust Your Meal Selection',
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.center,
          ),
          buildSwitchListTile('Gluten-Free', 'only include Gluten-Free Meals', _isGlutenFree, (newvalue) {
            setState(() {
              _isGlutenFree = newvalue;
            });
          }),
          buildSwitchListTile('Vegan', 'only include Vegan Meals', _isVegan, (newvalue) {
            setState(() {
              _isVegan = newvalue;
            });
          }),
          buildSwitchListTile('Vegetarian', 'only include Vegetarian Meals', _isVegetarian, (newvalue) {
            setState(() {
              _isVegetarian = newvalue;
            });
          }),
          buildSwitchListTile('Lactose-Free', 'only include Lactose-Free Meals', _isLactoseFree, (newvalue) {
            setState(() {
              _isLactoseFree = newvalue;
            });
          }),
        ],
      ),
    );
  }
}
