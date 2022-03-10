import 'dart:io';
import 'dart:math';

import 'package:b12_navigator_routing/constant.dart';
import 'package:b12_navigator_routing/plant_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'plant.dart';

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
    ScopedModel < Plant > (
      model: plant,
      child : 
        Row(children: [
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                // color: kBackgroundColor,
                boxShadow: [BoxShadow(
                  color: kPrimaryColor.withOpacity(0.24),
                  offset: Offset(10,10),
                  blurRadius: 10,
                )]
              ),
              height: size.height / 4,
              width: size.width / 2.5,
              // decoration: BoxDecoration(color: Colors.blue),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Hero(child: Image.asset(plant.imagePath, fit: BoxFit.cover), tag: plant.plantTitle)
              )
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PlantPage(plant: plant);
              }));
            },
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              height: size.height / 4,
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(offset: const Offset(10, 10), blurRadius: 10, color: kPrimaryColor.withOpacity(0.24))
              ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.only(left: 5, right: 5),
              child: Column(children: [
                Text(plant.plantTitle, style: const TextStyle(color: kTextColor, fontWeight: FontWeight.bold, fontSize: 25)),

                ScopedModelDescendant < Plant > (
                  builder: (context, child, plant) {
                    return RatingBox(plant: plant);
                  }
                )

                // RatingBox()
              ]),
            )
          )
        ])
    );
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
    int rating = plant.rating;
    return Container(
      
      child:
      Column(children: [
        Row(children: [
            IconButton(
              onPressed: () {
                plant.setRating(1);
              },
              icon: Icon(rating > 0 ? Icons.star : Icons.star_border)),
            IconButton(
              onPressed: () {
                plant.setRating(2);
              },
              icon: Icon(rating > 1 ? Icons.star : Icons.star_border)),
            IconButton(
              onPressed: () {
                plant.setRating(3);
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

