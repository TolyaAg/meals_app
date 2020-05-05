import 'package:flutter/material.dart';
import 'package:mealsapp/widget/main_drawer.dart';

class Filters extends StatefulWidget {
  final Map<String, bool> filters;
  final Function saveFilters;

  Filters(this.filters, this.saveFilters);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.filters['gluten'];
    _vegetarian = widget.filters['vegetarian'];
    _vegan = widget.filters['vegan'];
    _lactoseFree = widget.filters['lactose'];
    super.initState();
  }

  Widget _buildSwitchListTile(
      String title, String subtitle, bool currentValue, Function onChanged) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(subtitle),
      onChanged: onChanged,
    );
  }

  void saveFilters() {
    widget.saveFilters({
      'gluten': _glutenFree,
      'lactose': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (val) {
                    setState(() {
                      _glutenFree = val;
                    });
                    saveFilters();
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                    saveFilters();
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vagetarian meals.',
                  _vegetarian,
                  (val) {
                    setState(() {
                      _vegetarian = val;
                    });
                    saveFilters();
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (val) {
                    setState(() {
                      _vegan = val;
                    });
                    saveFilters();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
