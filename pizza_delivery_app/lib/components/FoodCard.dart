import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_delivery_app/constant.dart';
import 'package:scoped_model/scoped_model.dart';

import '../FoodPage.dart';
import '../model/food.dart';

class FoodCard extends StatefulWidget {
  FoodCard({
    Key ? key,
  }): super(key: key);

  
  @override
  State < FoodCard > createState() {
    return _FoodCard();
  }
}

class _FoodCard extends State < FoodCard > {
  // void _onTap() {
  //   Navigator.push(context, MaterialPageRoute(builder: (context) {
  //     return FoodPage(food: food, foodIndex: foodIndex, onTapStar: onTapStar);
  //   }));
  // }
  @override
  Widget build(BuildContext context) {
    Food food = ScopedModel.of<Food>(context);
    return
    GestureDetector(
      onTap: (
        () => Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ScopedModel<Food>(model: food, child: FoodPage());
                    // return FoodPage();
                  }
                )
              )
      ),
      child: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 0)),
          Container(
            height: 150,
            width: 300,
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(1, 1),
                  blurRadius: 5
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(-1, 1),
                  blurRadius: 5
                )
              ]
            ),
            child:
            Row(children: [
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/crown.svg'),
                        SizedBox(width: 10, ),
                        Text("top of the week", style: GoogleFonts.montserrat(fontSize: 13, fontWeight: FontWeight.w600, )),
                      ], )
                  ),
                  SizedBox(height: 10),
                  Padding(padding: EdgeInsets.only(left: 10),
                    child: Text(food.title, style: GoogleFonts.montserrat(fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                  SizedBox(height: 5, ),
                  Padding(padding: EdgeInsets.only(left: 10), child: Text(food.weight, style: GoogleFonts.montserrat(fontSize: 13, color: Color.fromRGBO(196, 196, 196, 1), fontWeight: FontWeight.w400))),
                  SizedBox(height: 20),
                  Expanded(
                    child:
                    Row(children: [

                        InkWell(child: 
                      Container(
                        alignment: Alignment.center,
                        width: 90,
                        child: SvgPicture.asset('assets/icons/plus.svg'),
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(25), bottomLeft: Radius.circular(25))
                        ),
                      ),
                      ),
                      
                      
                      SizedBox(width: 10),
                      Icon(Icons.star, size: 14, ),
                      Text(food.rating.toString(), style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 12), )
                    ], )
                  )
                ],
                crossAxisAlignment: CrossAxisAlignment.start, ),
              SizedBox(width: 20),
              Expanded(child:
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      image: AssetImage(
                        food.imagePath,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ), )
            ], )
          ),
          Padding(padding: EdgeInsets.only(bottom: 20))
        ]
      ),
    );

  }



}