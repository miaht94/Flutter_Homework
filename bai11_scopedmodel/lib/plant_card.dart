import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class PlantCard extends StatelessWidget {
  PlantCard({
    Key ? key,
    required this.plant
  }): super(key: key);

  Plant plant;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
    Row(children: [
      Container(
        height: size.height / 4,
        width: size.width / 2.5,
        // decoration: BoxDecoration(color: Colors.blue),
        child:
        ClipRRect(borderRadius: BorderRadius.circular(15),
          child: Image.asset(plant.imagePath, fit: BoxFit.cover))
      ),
      Expanded(
        child: Container(
          alignment: Alignment.center,
          height: size.height / 4,
          padding: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(offset: Offset(-1, 1), blurRadius: 10, color: Colors.blue.withOpacity(0.4))
          ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.only(left: 5, right: 5),
          child: Column(children: [
            Text(plant.plantTitle, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25)),
            ScopedModel < Plant > (
              model: plant,
              child: ScopedModelDescendant < Plant > (
                builder: (context, child, plant) {
                  return RatingBox(plant: plant);
                }
              )
            ),

            // RatingBox()
          ]),
        )
      )
    ]);
  }
}

class RatingBox extends StatelessWidget {
  RatingBox({
    Key ? key,
    required this.plant
  }): super(key: key);
  Plant plant;
  @override
  Widget build(BuildContext context) {
    int rating = plant._rating;
    return Container(
      child:
      Column(children: [
        Row(children: [
          IconButton(
            onPressed: () {
              plant._setRating(1);
            },
            icon: Icon(rating > 0 ? Icons.star : Icons.star_border)),
          IconButton(
            onPressed: () {
              plant._setRating(2);
            },
            icon: Icon(rating > 1 ? Icons.star : Icons.star_border)),
          IconButton(
            onPressed: () {
              plant._setRating(3);
            },
            icon: Icon(rating > 2 ? Icons.star : Icons.star_border)),
        ],
        mainAxisAlignment: MainAxisAlignment.center),
        
        ScopedModelDescendant < Plant > (builder: (context, child, model) {
          return Text(model.price);
        })


      ]),
    );
  }

}

class Plant extends Model {
  Plant(this._rating, this.plantTitle, this.imagePath, this.price);
  factory Plant.fromMap(Map < String, dynamic > json) {
    return Plant(json['rating'], json['plantTitle'], json['imagePath'], json['price']);
  }
  int _rating = 0;
  String plantTitle = "Undefined";
  String imagePath = "assets/images/image_1.png";
  String price = "1\$";

  void setPrice(String price) {
    price = price;
  }

  void _setRating(int rate) {
    _rating = rate;
    notifyListeners();
  }
  void setPlantTitle(String title) {
    plantTitle = title;
    notifyListeners();
  }
  void setImagePath(path) {
    imagePath = path;
    notifyListeners();
  }
  static List < Plant > initListProduct() {
    List < Plant > plants = < Plant > [];
    plants.add(Plant.fromMap({
      'plantTitle': "Plant 1",
      'rating': 1,
      'imagePath': "assets/images/image_1.png",
      'price': "10\$"
    }));
    plants.add(Plant.fromMap({
      'plantTitle': "Plant 2",
      'rating': 1,
      'imagePath': "assets/images/image_2.png",
      'price': "10\$"
    }));
    plants.add(Plant.fromMap({
      'plantTitle': "Plant 3",
      'rating': 1,
      'imagePath': "assets/images/image_3.png",
      'price': "10\$"
    }));
    plants.add(Plant.fromMap({
      'plantTitle': "Plant 4",
      'rating': 1,
      'imagePath': "assets/images/image_4.png",
      'price': "10\$"
    }));
    return plants;
  }
}