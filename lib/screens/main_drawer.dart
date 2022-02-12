import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              "Menu",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 20),
          buildDrawerItem(Icons.restaurant, "Meals", () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          buildDrawerItem(Icons.settings, "Filters", () {
            Navigator.of(context).pushReplacementNamed("/filters");
          }),
        ],
      ),
    );
  }

  ListTile buildDrawerItem(
      IconData icon, String title, Function handlerFunction) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontFamily: "RobotoCondensed",
            fontSize: 24,
            fontWeight: FontWeight.w500),
      ),
      onTap: () => handlerFunction(),
    );
  }
}
