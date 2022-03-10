import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizza_delivery_app/constant.dart';
import 'package:scoped_model/scoped_model.dart';

import 'model/food.dart';


class FoodPage extends StatefulWidget {
  FoodPage({
    Key ? key
  }): super(key: key);

  @override
  State < StatefulWidget > createState() {
    // TODO: implement createState
    return _FoodPage();
  }

}

class _FoodPage extends State < FoodPage > {
  // _FoodPage({required this.food, required this.foodIndex, required this.onTapStar});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Food food = ScopedModel.of < Food > (context);
    return Scaffold(
      body:
      ScopedModel < Food > (model: food, child:
        ScopedModelDescendant < Food > (builder: (context, child, model) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  Material(child:
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child:
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 50,
                        child: Icon(Icons.chevron_left),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color.fromRGBO(205, 205, 205, 1), width: 2.5),
                          borderRadius: BorderRadius.circular(10)
                        ),
                      ), )
                  ),
                  Expanded(child: Container()),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: model.stared ? Icon(Icons.star, color: Colors.white) : Icon(Icons.star_border, color: kPrimaryColor, ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(model.stared ? 1 : 0),
                        border: Border.all(color: kPrimaryColor.withOpacity(0.6), width: 2.5),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    onTap: () {
                      // onTapStar(foodIndex);
                      // print("tap");
                      model.stared = !model.stared;
                    }
                  )

                ]),
              ),
              SizedBox(height: 30, ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(child: Text(model.title, style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 32), maxLines: 1, ),
                  width: 200,
                )
              ),
              SizedBox(height: 20, ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(child: Text("\$${model.price}", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 32, color: Color.fromRGBO(228, 114, 60, 1), ), maxLines: 1, ),
                  width: 200,
                )
              ),
              SizedBox(height: 20, ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Size", style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 20, color: Color.fromRGBO(205, 205, 205, 1))),
                      Text("Medium 14\"", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black)),
                      SizedBox(height: 20, ),
                      Text("Crust", style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 20, color: Color.fromRGBO(205, 205, 205, 1))),
                      Text("Thin Crust", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black)),
                      SizedBox(height: 20, ),
                      Text("Delivery in", style: GoogleFonts.montserrat(fontWeight: FontWeight.w400, fontSize: 20, color: Color.fromRGBO(205, 205, 205, 1))),
                      Text("30 mins", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.black)),
                    ]
                  ),
                  SizedBox(width: 40, ),
                  Expanded(child:
                    Container(
                      height: 100,
                      // width: 50,
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.centerLeft,
                          image: AssetImage(
                            model.imagePath,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ), )
                ], )
              ),
              SizedBox(height: 30, ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(children: [
                  Text("Ingredients", style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),

                  Container(height: 100,
                    child:
                    ListView(scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(top: 10, bottom: 5, left: 2, right: 2),
                      children: [
                        Container(
                          width: 100,
                          height: 80,
                          child: Image.asset("assets/images/tomato.png"),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(offset: Offset(1, 1),
                                color: Colors.black.withOpacity(0.23),
                                blurRadius: 4
                              ),

                            ]
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 6)),
                        Container(
                          width: 100,
                          height: 80,
                          child: Image.asset("assets/images/cheese.png"),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(offset: Offset(1, 1),
                                color: Colors.black.withOpacity(0.23),
                                blurRadius: 4
                              ),

                            ]
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 6)),
                        Container(
                          width: 100,
                          height: 80,
                          child: Image.asset("assets/images/ham.png"),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(offset: Offset(1, 1),
                                color: Colors.black.withOpacity(0.23),
                                blurRadius: 4
                              ),

                            ]
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 6)),
                        Container(
                          width: 100,
                          height: 80,
                          child: Image.asset("assets/images/garlic.png"),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(offset: Offset(1, 1),
                                color: Colors.black.withOpacity(0.23),
                                blurRadius: 4
                              ),

                            ]
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 6)),
                      ], )
                  )
                ]), ),
              SizedBox(height: 15),
              Padding(padding: EdgeInsets.symmetric(horizontal: 50), 
              child: Container(
                alignment: Alignment.center,
                width: size.width - 100,
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
                  color: kPrimaryColor
                ),
                child: 
                Row(children: [
                  Text("Place an order", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.bold)),
                  Icon(Icons.chevron_right)
                ],
                mainAxisAlignment: MainAxisAlignment.center,
                )
              )
              )
              

            ]);
        }, )

      )

    );
  }
}