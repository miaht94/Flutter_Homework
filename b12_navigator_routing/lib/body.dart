import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'plant.dart';
import 'plant_card.dart';

class MainBody extends StatefulWidget {
  MainBody({
    Key ? key,
    required this.plants,
    required this.listviewScrollController
  }): super(key: key);
  ScrollController listviewScrollController;
  List < Plant > plants;
  @override
  State <MainBody> createState() {
    return _MainBody(plants: plants, controller: listviewScrollController);
  }
}

class _MainBody extends State < MainBody > {
  _MainBody({
    Key ? key,
    required this.plants,
    required this.controller
  });
  List < Plant > plants;
  ScrollController controller;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Positioned.fill(
      top: 0,
      child: Container(
        decoration: BoxDecoration(color: Colors.amber.withOpacity(0)),
        padding: EdgeInsets.only(left: 5,),
        child: ListView.builder(
          controller: controller,
          padding: EdgeInsets.only(top: size.height * 0.27),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8, top: 4),
                child: PlantCard(plant: plants.elementAt(index)),
            );
          },
          itemCount: plants.length,
        )
      )
    );
  }
}