import 'package:flutter/material.dart';
import 'package:shop_app/screens/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const String routeName = "/filters";
  const FiltersScreen(
      {Key? key, required this.saveFilters, required this.filters})
      : super(key: key);

  final Function saveFilters;
  final Map<String, bool> filters;

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters["gluten"] ?? false;
    _vegetarian = widget.filters["vegetarian"] ?? false;
    _vegan = widget.filters["vegan"] ?? false;
    _lactoseFree = widget.filters["lactose"] ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            onPressed: () => widget.saveFilters({
              "gluten": _glutenFree,
              "vegan": _vegan,
              "vegetarian": _vegetarian,
              "lactose": _lactoseFree
            }),
            icon: Icon(Icons.save),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile("Gluten-free", _glutenFree, (value) {
                setState(() {
                  _glutenFree = value;
                });
              }),
              buildSwitchListTile("Vegetarian", _vegetarian, (value) {
                setState(() {
                  _vegetarian = value;
                });
              }),
              buildSwitchListTile("Vegan", _vegan, (value) {
                setState(() {
                  _vegan = value;
                });
              }),
              buildSwitchListTile("Lactose-free", _lactoseFree, (value) {
                setState(() {
                  _lactoseFree = value;
                });
              }),
            ],
          ))
        ],
      ),
    );
  }

  SwitchListTile buildSwitchListTile(String title, bool filter, Function? f) {
    return SwitchListTile(
      title: Text(title),
      value: filter,
      onChanged: (value) => f!(value),
    );
  }
}
