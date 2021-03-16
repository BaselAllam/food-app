import 'package:flutter/material.dart';
import 'package:food/screens/bottomnavbar/bookmark.dart';
import 'package:food/screens/bottomnavbar/homepage.dart';
import 'package:food/screens/bottomnavbar/profile.dart';
import 'package:food/screens/bottomnavbar/search.dart';
import 'package:food/screens/bottomnavbar/sell.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:food/models/mealscontroller.dart';


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text('Add'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text('Bookmark'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 20.0),
        selectedIconTheme: IconThemeData(color: Colors.black, size: 20.0),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
      ),
      body: ScopedModelDescendant(
        builder: (context, child, MealsController meals){
          if(current == 0){
            return HomePage(meals);
          }else if(current == 1){
            return Sell();
          }else if(current == 2){
            return Search();
          }else if(current == 3){
            return BookMark();
          }else{
            return Profile();
          }
        }
      )
    );
  }
}