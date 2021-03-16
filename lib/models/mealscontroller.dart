import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food/models/mealsmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class MealsController extends Model{

  
  bool _isGetMealsLoading = false;
  bool get isGetMealsLoading => _isGetMealsLoading;

  bool _isAddMealsLoading = false;
  bool get isAddMealsLoading => _isAddMealsLoading;

  List<MealsModel> _allMeals = [];
  List<MealsModel> get allMeals => _allMeals;


  getMeals() async {

    _isGetMealsLoading = true;
    notifyListeners();

    http.Response _response = await http.get('https://food-26798-default-rtdb.firebaseio.com/meals.json');

    var _data = json.decode(_response.body);

    _data.forEach((x, i){
        final MealsModel _newMeal = MealsModel(
          id: x,
          title: i['title'],
          price: i['price'],
          image: i['image']
        );
        _allMeals.add(_newMeal);
      });

    // Firestore.instance.collection('meals').getDocuments().then((QuerySnapshot shot){
    //   shot.documents.forEach((i){
    //     final MealsModel _newMeal = MealsModel(
    //       id: i.documentID,
    //       title: i['title'],
    //       price: i['price'],
    //       image: i['image']
    //     );
    //     _allMeals.add(_newMeal);
    //   });
    // });
    _isGetMealsLoading = false;
    notifyListeners();

  }


  addMeal(String title, double price, String image) async {

    _isAddMealsLoading = true;
    notifyListeners();

    Map<String, dynamic> _data = {
      'title': title,
      'price' : price,
      'image' : image
    };

    http.Response _response = await http.post('https://food-26798-default-rtdb.firebaseio.com/meals.json', body: json.encode(_data)); 

    //Firestore.instance.collection('meals').add(_data);

    _isAddMealsLoading = false;
    notifyListeners();

  }

}




// Model => Inherit from to be able to share Data and Notify Liseteners

// ScopedModel => Top of App Tree to make all Controllers visible to all app

// ScopedModelDecendent => Parent for any Widget that want to listen to changes and share data