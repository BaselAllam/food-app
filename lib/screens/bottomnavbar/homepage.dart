import 'package:flutter/material.dart';
import 'package:food/screens/result.dart';
import 'package:food/widgets/item.dart';
import 'package:food/screens/searchmap.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:food/models/mealscontroller.dart';
import 'package:food/widgets/loading.dart';


class HomePage extends StatefulWidget {

final MealsController meals;
HomePage(this.meals);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

@override
void initState() {
  widget.meals.getMeals();
  super.initState();
}


Map<int, List> data = {
  0 : [
    'https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-2foodgroups_vegetables_detailfeature.jpg?sfvrsn=226f1bc7_6',
    'Fruites',
    200.5
  ],
  1 : [
    'https://www.verywellfit.com/thmb/a4580FjTjbub9q4kI5m9X-Po-p0=/2002x1334/filters:no_upscale():max_bytes(150000):strip_icc()/Bananas-5c6a36a346e0fb0001f0e4a3.jpg',
    'Banana',
    500.0
  ],
  2 : [
    'https://2rdnmg1qbg403gumla1v9i2h-wpengine.netdna-ssl.com/wp-content/uploads/sites/3/2016/10/healthyFruit-517472788-770x533-1-650x428.jpg',
    'Roman',
    200.0
  ],
  3 : [
    'https://www.wcrf-uk.org/sites/default/files/Apple_A-Z%20Fruit1.jpg',
    'Apple',
    100.0
  ],
  4 : [
    'https://californiaavocado.com/wp-content/uploads/2020/07/avocado-fruit-berry.jpg',
    'Avocado',
    600.0
  ]
};

bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Discover',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Container(
        child: ListView(
          scrollDirection : Axis.vertical,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: ListTile(
                title: Text(
                  'Search on Map',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal
                  ),
                ),
                trailing: Icon(Icons.location_on, color: Colors.grey, size: 25.0),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(fullscreenDialog: true, builder: (_) {return SearchMap();}));
                },
              ),
            ),
            headLineItem('Featured Item'),
            Container(
              height: MediaQuery.of(context).size.height/2.5,
              child: scrollItem(350.0, 170.0),
            ),
            headLineItem('Trending'),
            Container(
              height: MediaQuery.of(context).size.height/2.9,
              child: scrollItem(MediaQuery.of(context).size.height/2.5, 140.0)
            ),
            headLineItem('Hot Offers'),
            Container(
              height: MediaQuery.of(context).size.height/2.9,
              child: scrollItem(MediaQuery.of(context).size.height/2.5, 140.0)
            ),
          ],
        ),
      ),
    );
  }
  headLineItem(String title) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
      ),
      trailing: Text(
        'View More',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 15.0,
          fontWeight: FontWeight.normal
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {return Results(title);}));
        //Navigator.pushNamed(context, 'results');
      }
    );
  }
  scrollItem(double itemWidth, double imageHeight) {
    return ScopedModelDescendant(
      builder: (context, child, MealsController meals){
        if(meals.isGetMealsLoading == true){
          return Center(child: Loading());
        }else if(meals.allMeals.isEmpty){
          return Center(child: Text('No Meals Found'));
        }else{
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: meals.allMeals.length,
            itemBuilder: (context, index){
              return Item(itemWidth, imageHeight, meals.allMeals[index].image, meals.allMeals[index].title, meals.allMeals[index].price);
            }
          );
        }
      } 
    );
  }
}