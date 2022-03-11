import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async'; 
import 'dart:convert'; 
import 'package:http/http.dart' as http;

import '../constant.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Food extends Model {
  Food( this._title, this._rating, this._imagePath, this._stared, this._price, this._weight);

  String _title;
  double _rating;
  bool _stared;
  double _price;
  String _weight;
  String _imagePath;

  factory Food.fromJson(Map<String, dynamic> data) {
    return Food(data["title"], data["rating"], data["imagePath"], data["stared"], data["price"], data["weight"]);
  }

  String get title {
    return this._title;
  }

  double get rating {
    return _rating;
  }

  bool get stared {
    return this._stared;
  }
  double get price {
    return this._price;
  }
  String get weight {
    return this._weight;
  }

  String get imagePath {
    return this._imagePath;
  }

  void set title(String title) {
    this._title = title;
    notifyListeners();
  }

  void set rating(double rating) {
    this._rating = rating;
    notifyListeners();
  }

  void set stared(bool stared) {
    this._stared = stared;
    notifyListeners();
  }

  void set price(double price) {
    this._price = price;
    notifyListeners();
  }

  void set weight(String weight) {
    this._weight = weight;
    notifyListeners();
  }

  void set imagePath(String imagePath) {
    this._imagePath = imagePath;
    notifyListeners();
  }

  static List<Food> sampleFood() {
    List<Food> foods = [Food("Pizza 1", 5.0, "assets/images/pizza1.png", false, 5.99, "Weight 50gr"),
                        Food("Pizza 2", 6.0, "assets/images/pizza2.png", false, 2.99, "Weight 50gr"),
                        Food("Pizza 3", 7.0, "assets/images/pizza3.png", false, 4.99, "Weight 50gr"),
                        Food("Pizza 4", 8.0, "assets/images/pizza1.png", false, 3.99, "Weight 50gr")];
    return foods;
  }

  static List<Food> parseFood(String res) {
    final parsed = json.decode(res).cast<Map<String, dynamic>>();
    return parsed.map<Food>((json) => Food.fromJson(json)).toList();
  }
  static Future<List<Food>> fetchFoods() async {
    final res = await http.get(Uri.parse(entryToFoodsDotJson));
    if (res.statusCode == 200) {
      return Food.parseFood(res.body);
    } else {
      throw Exception('Unable to fetch');
    }
  }
  // static Stream<QuerySnapshot> fetchFireFoods() {
  //   return FirebaseFirestore.instance.collection('food').snapshots();
  // }
}