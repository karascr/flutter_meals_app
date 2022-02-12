import 'package:flutter/material.dart';
import 'package:shop_app/screens/filters_screen.dart';
import 'package:shop_app/screens/meal_detail_screen.dart';
import 'package:shop_app/screens/tabs_screen.dart';

import 'models/meal.dart';
import 'screens/category_screen.dart';
import '/dummy_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals = DUMMY_MEALS;
  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false,
    "vegan": false,
    "vegetarian": false,
  };

  void _setFilters(Map<String, bool> newFilters) {
    setState(() {
      _filters = newFilters;

      _availableMeals = DUMMY_MEALS.where((m) {
        if ((_filters["gluten"] ?? false) && !m.isGlutenFree) {
          return false;
        }
        if ((_filters["lactose"] ?? false) && !m.isLactoseFree) {
          return false;
        }
        if ((_filters["vegan"] ?? false) && !m.isVegan) {
          return false;
        }
        if ((_filters["vegetarian"] ?? false) && !m.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
      print(_availableMeals.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sweat Meals',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: "Raleway",
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                bodyText2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
                headline6:
                    TextStyle(fontSize: 20, fontFamily: "RobotoCondensed"),
              )),
      initialRoute: "/",
      routes: {
        "/": (context) => TabsScreen(),
        CategoryScreen.routeName: (context) =>
            CategoryScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FiltersScreen.routeName: (context) =>
            FiltersScreen(saveFilters: _setFilters, filters: _filters),
      },
    );
  }
}
