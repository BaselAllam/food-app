import 'package:flutter/material.dart';
import 'package:food/screens/bottomnavbar/bookmark.dart';
import 'package:food/screens/bottomnavbar/homepage.dart';
import 'package:food/screens/bottomnavbar/profile.dart';
import 'package:food/screens/bottomnavbar/search.dart';
import 'package:food/screens/bottomnavbar/shoppingcart.dart';



class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

int current = 0;

List<Widget> screens = [
  HomePage(), ShoppingCart(), Search(), BookMark(), Profile(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Cart'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
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
      body: screens[current]
    );
  }
}