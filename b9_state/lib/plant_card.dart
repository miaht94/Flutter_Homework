import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class PlantCard extends StatelessWidget {
  PlantCard({Key? key, required this.plant_name, required this.price, required this.image_path}) : super(key: key);
  
  String plant_name;
  String price;
  String image_path;
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return 
    Row(children: [
      Container(
        height: size.height/4,
        width: size.width/2.5,
        // decoration: BoxDecoration(color: Colors.blue),
        child: 
          ClipRRect(borderRadius: BorderRadius.circular(15),
            child: Image.asset(image_path, fit: BoxFit.cover))
      ),
      Expanded(
        child: Container(
          alignment: Alignment.center,
          height: size.height/4,
          padding: EdgeInsets.only(top:10),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(offset: Offset(-1,1), blurRadius: 10, color: Colors.blue.withOpacity(0.4))
          ], color: Colors.white, borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.only(left: 5, right: 5),
          child: Column(children: [
            Text(plant_name, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 25)),
            RatingBox()
          ]),
        )
      )
    ]);
  }
}


class RatingBox extends StatefulWidget {
  RatingBox({Key? key}): super(key : key);
  
  @override
  State<StatefulWidget> createState() {
    return _RatingBox();
  }
}

class _RatingBox extends State<RatingBox> {
  int _rating = 0;
  void _setRatingAsOne() {
      setState(() {
        _rating = 1;
      });
    }
    void _setRatingAsTwo() {
      setState(() {
        _rating = 2;
      });
    }
    void _setRatingAsThree() {
      setState(() {
        _rating = 3;
      });
    }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        IconButton(onPressed: _setRatingAsOne, icon: Icon(_rating > 0 ? Icons.star : Icons.star_border)),
        IconButton(onPressed: _setRatingAsTwo, icon: Icon(_rating > 1 ? Icons.star : Icons.star_border)),
        IconButton(onPressed: _setRatingAsThree, icon: Icon(_rating > 2 ? Icons.star : Icons.star_border))
      ], mainAxisAlignment: MainAxisAlignment.center,),
    );
  }

}