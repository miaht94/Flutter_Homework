import 'dart:io';

import 'package:b12_navigator_routing/plant_card.dart';
import 'package:flutter/material.dart';

class PlantPage extends StatelessWidget {
  PlantPage({
    Key ? key,
    required this.plant
  }): super(key: key);
  Plant plant;
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: null,
      body: PlantPageBody(plant: plant),
    );
  }
}

class PlantPageBody extends StatelessWidget {
  PlantPageBody({
    Key ? key,
    required this.plant
  }): super(key: key);
  Plant plant;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
    Column(
      children: [
        Container(

          child: Stack(
            overflow: Overflow.visible,
            children: [
              Container(
                height: 0.28 * size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                ),
              ),
              Positioned(
                width: size.width / 2.5,
                height: size.width / 2.5,
                top: 0.28 * size.height - size.width / 2.5 / 2,
                left: size.width / 2 - size.width / 2.5 / 2,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Hero(tag: plant.plantTitle, child: CircleAvatar(backgroundImage: Image.asset(plant.imagePath).image, ))),
              )
            ],
          )
        ),
        Padding(padding: EdgeInsets.only(bottom: size.width / 2.5 / 2)),
        Text(plant.plantTitle,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 25)
        )
      ],
    );
  }

}